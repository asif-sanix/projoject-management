<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use App\Admin;
use App\Model\AdminLogin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/admin/dashboard';



    public function showLoginForm()
    {
        return view('admin.auth.login');
    }





    public function login(Request $request)
    { 
         
        $this->validate($request, [
            'email' => 'required',
            'password'=>'required',
        ]);

        if($this->guard()->attempt(['email' => request('email'), 'password' => request('password'),'status' => 1])) {
        $admin =  Auth::guard('admin')->user();
        return redirect()->to('/admin/dashboard');
        } 

        if ($admin = Admin::where('email',$request->email)->first()) {
            if ($admin->status == 0) {
                //['email'=>'inactive','password'=>'You are not an active person, please contact Admin'];
                return redirect()->back()->withErrors(['email'=>'You are not an active person, please contact with Owner.','status'=>false]);
            } else{
                return redirect()->back()->withErrors(['email'=>'These credentials do not match our records.','status'=>true]); 
            }
        }  
        else{
            return redirect()->back()->withErrors(['email'=>'These credentials do not match our records.']); 
        }
        
        
    }



    public function logout()
    {
        $this->guard()->logout();
        return redirect()->route('admin.login.form');
    }



    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('admin.guest', ['except' => 'logout']);
    }


    protected function guard()
    {
        return Auth::guard('admin');
    }

}
