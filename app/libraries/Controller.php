<?php

namespace App\libraries;
// this is the base controller loads the model and views
class Controller
{
  /**
   * Summary of model
   * @param mixed $model
   * @return object
   */
  public function model($model)
  {
    // required model files
    require '../app/models/' . $model . '.php';

    return new $model;
  }

  public function view($view, $data = [])
  {
    // check if file exists 
    $file = '../app/views/' . $view . '.php';
    if (file_exists($file)) {
      require $file;
    } else {
      header("Location: /HomeController");
    }
  }
}
