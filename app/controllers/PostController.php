<?php

use App\libraries\Controller;

class PostController extends Controller
{

  public function index()
  {
    $this->view('Post/post');
  }
  public function about()
  {
  }
}
