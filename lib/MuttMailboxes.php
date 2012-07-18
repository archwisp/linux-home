<?php

class MuttMailboxes
{
   public static function getList($folder, $seed, $prefix)
   {
      $mailboxes = $seed;

      $entries = MindFrame2_Filesystem::ls($folder, '/^\.[A-Z]/');

      foreach ($entries as $entry)
      {
         $mailboxes .= sprintf(" +'%s%s'", $prefix, $entry);
         $mailboxes .= $this->fetch($folder . '/' . $entry, NULL, $entry . '/');
      }

      return $mailboxes;
   }
}
