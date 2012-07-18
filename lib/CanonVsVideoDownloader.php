<?php

/**
 * @file
 * Moves the files from the source directory into 
 * {destination}/{year}/{month}-{day}
 */

/**
 * Moves the files from the source directory into 
 * {destination}/{year}/{month}-{day}
 *
 * @author Bryan Geraghty <bgeraghty@xapiens.net>
 * @since 2010-12-06
 */
class CanonVsVideoDownloader
{
   public function download($source, $destination)
   {
      $files = MindFrame2_Filesystem::lsRecursive($source, '/^.*?\.MO[ID]/');

      foreach ($files as $file)
      {
         $this->_move($file, $destination);
      }
   }

   private function _move($file, $base_path)
   {
      $file_date = filemtime($file);
      
      $destination_directory = sprintf('%s/%s/%s', 
         $base_path, date('Y', $file_date), 
         date('m-d', $file_date));

      $destination_file = sprintf('%s/%s', 
         $destination_directory, basename($file));

      if (!file_exists($destination_directory))
      {
         printf("Creating directory %s ...\n\n", $destination_directory);
         mkdir($destination_directory, 700, TRUE);
      }
      
      printf("Moving %s to %s ...\n", $file, $destination_file);
      rename($file, $destination_file);
   }
}
