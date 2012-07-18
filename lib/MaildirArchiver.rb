require 'date';
require 'fileutils';

class MaildirArchiver
   
   attr_accessor :base_path

   def initialize(base_path)
      @base_path = base_path
   end

   def archive()
      archive_date = Date.parse(Date.today().<<(3).to_s());
      puts 'Archiving mail older than: ' + archive_date.to_s();
      
      self.get_mailboxes().each{ |mailbox|
         self.archive_mailbox(mailbox, archive_date);
      }
   end

   def archive_mailbox(mailbox, archive_date)
      cwd = base_path + mailbox;
      puts 'Changing to directory: ' + cwd;
      Dir.chdir(cwd);

      Dir.glob('*/*').each() do |file_name|
         if File.file?(file_name) then

            mail_date = self.get_mail_date(file_name);

            if mail_date.instance_of? Date then
            
               if mail_date.strftime('%s').to_i() < archive_date.strftime('%s').to_i() then

                  archive_folder = self.create_archive_folder(mail_date) + '/cur/';
                  puts 'Moving (' + file_name + ') to (' + archive_folder + ')'
                  FileUtils.mv(file_name, archive_folder);

               end
            else
               warn('Did not receive a valid date for file: ' + base_path + mailbox + '/' + file_name);
            end

         end
      end
   end

   def get_mail_date(file_name)
      File.open(file_name){ |file|
         file.grep(/^Date:\s+.*?(\d{1,2} [A-Z][a-z]{2} \d{4})/) { |match|
            return Date.parse($1);
         }
      }
   end

   def create_archive_folder(date)
      quarter = (((date.mon() + 2) / 3)).to_s;
      archive_folder = '.Archive-' + date.year().to_s + "-Q" + quarter; 

      FileUtils.mkdir_p(archive_folder + '/cur');
      FileUtils.mkdir_p(archive_folder + '/new');
      FileUtils.mkdir_p(archive_folder + '/tmp');

      return archive_folder;
   end

   def get_mailboxes()
      Dir.chdir(base_path);
      return Dir['.[A-Z]*'];
   end
end
