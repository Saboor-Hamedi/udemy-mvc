
<?php

use App\libraries\Controller;

class ErrorController extends Controller
{

    public function index()
    {
        $this->view('../public/_404');
    }
}
