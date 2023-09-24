<?php

namespace App\libraries;

use Dotenv\Dotenv;

class Database
{
  public function __construct()
  {
    $dotenv = \Dotenv\Dotenv::createImmutable(__DIR__ . '/../../');
    $dotenv->load();


    print_r($_ENV['MYSQL_USER']);
  }
}
