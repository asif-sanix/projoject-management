<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
              

              @php
                $menus = \App\Model\Menu::select('name','slug','icon')
                ->where(function($query){
                    $query->whereNull('parent');
                    $query->whereStatus(1);
                    $query->whereHas('rolePermissions',function($query){
                        $query->where('role_permissions.role_id','=',auth('admin')->user()->role_id);
                        $query->whereRaw("role_permissions.permission_key = concat('browse_',menus.slug)");
                    });
                })
                ->orWhere(function($query){
                    $query->whereStatus(1);
                    $query->orderBy('ordering','asc');
                    $query->whereHas('childs',function($query){
                        $query->select('slug','parent','name');
                        $query->whereStatus(1);

                        $query->whereHas('rolePermissions',function($query){
                            $query->where('role_permissions.role_id','=',auth('admin')->user()->role_id);
                            $query->whereRaw("role_permissions.permission_key = concat('browse_',laravel_reserved_0.slug)");
                        });
                    });
                })->with(['childs'=>function($query){
                    $query->select('slug','parent','name');
                    $query->whereStatus(1);

                    $query->whereHas('rolePermissions',function($query){
                        $query->where('role_permissions.role_id','=',auth('admin')->user()->role_id);
                        $query->whereRaw("role_permissions.permission_key = concat('browse_',menus.slug)");
                    });
                }])
                ->orderBy('ordering','asc')
                ->get();
            @endphp




             @foreach ($menus as $menu)
                @if(!$menu->childs->count() && Route::has("admin.".Str::slug($menu->slug, '-').".index"))
                    <li class="{{ request()->segment(2) == Str::slug($menu->slug, '-')?'active':''}}">
                        <a href="{{ route("admin.".Str::slug($menu->slug, '-').".index")}}" class=" waves-effect">
                            <i class="{{ $menu->icon??'fa fa-arrow-right' }}"></i> 
                            <span>{{ $menu->name }}</span>
                        </a>
                    </li>
                @endif
                @if($menu->childs->count())


                <li class="{{ ($menu->childs->whereIn('slug',str_replace('-', '_', request()->segment(2)))->count())?'active open':'' }}">
                    <a href="javascript:;" class="has-arrow waves-effect">
                        <i class="{{ $menu->icon??'fa fa-list' }}"></i>
                        <span>{{ $menu->name }}</span>
                    </a>
                  <ul class="sub-menu" aria-expanded="false">

                     @foreach($menu->childs as $child)
                         @if(Route::has("admin.".Str::slug($child->slug, '-').".index"))
                            <li class="{{ ($child->slug == str_replace('-', '_', request()->segment(2)))?'active':'' }}">
                                <a href="{{ route('admin.'.Str::slug($child->slug, '-').'.index')}}">{{ $child->name }}</a>
                            </li>
                         @endif

                      @endforeach   
                    
                  </ul>
                </li>

                @endif
            @endforeach


                <li>
                    <a href="calendar.html" class=" waves-effect">
                        <i class="bx bx-calendar"></i>
                        <span>Calendar</span>
                    </a>
                </li>


                <li>
                    <a href="javascript: void(0);" class="has-arrow waves-effect">
                        <i class="bx bx-layout"></i>
                        <span>Layouts</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="layouts-horizontal.html">Horizontal</a></li>
                        <li><a href="layouts-light-sidebar.html">Light Sidebar</a></li>
                        <li><a href="layouts-compact-sidebar.html">Compact Sidebar</a></li>
                        <li><a href="layouts-icon-sidebar.html">Icon Sidebar</a></li>
                        <li><a href="layouts-boxed.html">Boxed Width</a></li>
                        <li><a href="layouts-preloader.html">Preloader</a></li>
                        <li><a href="layouts-colored-sidebar.html">Colored Sidebar</a></li>
                    </ul>
                </li>

                

            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>