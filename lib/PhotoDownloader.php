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
class PhotoDownloader
{
   CONST HASH_MD5 = 1;
   CONST HASH_SHA512 = 2;
   CONST HASH_SKEIN512 = 3;
   CONST HASH_BLAKE512 = 4;
   CONST HASH_GROESTL512 = 5;
   CONST HASH_JH512 = 6;
   CONST HASH_KECCAK512 = 7;

   private $_use_hash = self::HASH_MD5;

   private $_hased_bytes = 0;

   private $_hash_time = 0;

   public function download($source, $destination)
   {
      $source = str_replace('\ ', ' ', $source);
      $destination = str_replace('\ ', ' ', $destination);

      $files = MindFrame_Filesystem::listRecursive($source, '/^.*?\.jpg/');

      $failures = array();

      foreach ($files as $file)
      {
         if (!$this->_copy($file, $destination))
         {
            $failures[] = $file;
         }
      }

      if (!empty($failures))
      {
         echo "Failed to copy the following files:\n\n";

         foreach ($failures as $failure)
         {
            echo $failure . "\n";
         }
      }

      printf("Processed (%s) files\n", count($files));
      printf("Hashed (%s) bytes\n", $this->_hashed_bytes);
      printf("Time spent hashing: (%s) seconds\n", $this->_hash_time);
   }

   public function setHashFunction($id)
   {
      $this->_use_hash = $id;
   }

   private function _copy($file, $base_path)
   {
      $file_date = filemtime($file);
      
      $destination_directory = sprintf('%s/%s/%s', 
         $base_path, date('Y', $file_date), 
         date('m-d', $file_date));

      $destination_file = sprintf('%s/%s', 
         $destination_directory, basename($file));

      if (!file_exists($destination_directory))
      {
         printf("\nCreating directory %s ...\n\n", $destination_directory);
         mkdir($destination_directory, 777, TRUE);
      }
      
      if (!file_exists($destination_file) 
         || !$this->_verify($file, $destination_file))
      {
         printf("Copying %s to %s ...\n", $file, $destination_file);
         
         // copy($file, $destination_file);
         
         if ($this->_verify($file, $destination_file) === FALSE)
         {
            return FALSE;
         }
         // end if // ($this->_verify($file, $destination_file) === FALSE) //
      }
      else
      {
         // printf("File already exists %s ...\n", $destination_file);
      }
      // end else // if (!file_exists($destination_file) //

      return TRUE;
   }

   private function _hash($string)
   {
      // This will produce a rough estimate of the number of bytes hashed
      $this->_hashed_bytes += strlen($string);

      $start_time = microtime(TRUE);

      switch ($this->_use_hash)
      {
      case self::HASH_BLAKE512:
         $hashed = blake($string, BLAKE_512);
         break;
      
      case self::HASH_GROESTL512:
         $hashed = groestl_hash($string);
         break;
      
      case self::HASH_JH512:
         $hashed = jh_hash($string);
         break;
      
      case self::HASH_KECCAK512:
         $hashed = keccak_hash($string);
         break;

      case self::HASH_MD5:
         $hashed = mhash(MHASH_MD5, $string);
         break;

      case self::HASH_SHA512:
         $hashed = mhash(MHASH_SHA512, $string);
         break;
      
      case self::HASH_SKEIN512:
         $hashed = skein_hash($string, 512);
         break;

      default:
         throw RuntimeException('Unknown hash function');
      }

      $this->_hash_time += (microtime(TRUE) - $start_time);

      return $hashed;
   }

   private function _verify($file_a, $file_b)
   {
      $hash_a = $this->_hash(file_get_contents($file_a));
      $hash_b = $this->_hash(file_get_contents($file_b));
      
      if ($hash_a === $hash_b)
      {
         return TRUE;
      }
      // end if // ($hash_a === $hash_b) //

      return FALSE;
   }
}
