<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0; z-index: 100">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="dashboard"><i
			class="glyphicon glyphicon-home"></i> Invoice Management</a>
	</div>

	<!-- /.search-function -->	
    <div id="form" class="ui-widget col-xs-2" style="margin-top: 6px; margin-left: 20px">    	             
        <input class="form-control" id="invoice" placeholder="Search Invoice(s) ..."/>      
    </div>
     <div class="ui-widget col-xs-2" style="margin-top: 6px; margin-left: 0px"> 
        <select id="select" class="form-control">
		  <option>Name</option>
		  <option>Place</option>
		  <option>Amount</option>
		  <option>Time</option>
		  <option>IsWarning</option>
		</select>
    </div> 
	
	<script>
	$(document).ready(function() {		
	    $(function() {
	
	$("#invoice").autocomplete(
			
			{			   
			    source : function(request, response) {
			    	//alert($("#select").val());
			        $.ajax({                            
			        	url: "/InvoiceManagement/getSearchValue/" + $("#select").val(),
	                    type: "POST",
	                    data: { term: request.term },
			            dataType : "json",
			            success : function(data) {
			                response($.map(data, function(item, i) {
			                	if(i<10){
				                	if($("#select").val() == "Name"){
					                    return {			                    	
					                        value : item.name,
					                        desc : item.name
					                    }
				                	}
				                	if($("#select").val() == "Place"){
				                		return {			                    	
					                        value : item.place,
					                        desc : item.place
					                    }
				                	}	
			                	}
			                }));
			            }
			        });
			    },
			    focus : function(event, ui) {                   
			        $(this).val(ui.item.name);
			        return false;
			    },
			    select: function (event, ui) {
			    	 var name = ui.item.value;
			    	 var attribute = document.getElementById('select').value;	   
			    	 window.location = "Invoice/search/" + name + "/" + attribute;
	            }
			}).data("uiAutocomplete")._renderItem = function(ul, item) {			
				var str = item.desc;				
				var page = document.getElementById('invoice').value;
				var reg = new RegExp(page, "gi");
				var res = str.replace(reg, page.fontcolor("blue").bold().fontsize(4));					
			    return $("<li></li>").data("item.autocomplete", item).append(
			    		res)
			    .appendTo(ul);
			}; 
	    });
	});
	
	</script>
	
	<script>
	
	$("#form").keydown(function(event) {
	    if (event.keyCode == 13){
	    	var name = document.getElementById('invoice').value;
	    	var attribute = document.getElementById('select').value;	    	
        	window.location = "Invoice/search/" + name + "/" + attribute;
	    }
	        
	});		
	
	/*$(document).ready(function() {
	    $(function() {
	        $("#invoice").autocomplete({
	        	
	            source: function(request, response) {
	                $.ajax({
	                    url: "/InvoiceManagement/getSearchValue",
	                    type: "POST",
	                    data: { term: request.term },

	                    dataType: "json",

	                    success: function(data) {
	                    	response($.map(data, function(item){
	                    		//if(i<5){
	                    			//var t = v.name;
		                    	    return {
		                    	    	
		                    	    			value: item.name,
		                    	                desc: item.id
		                    	               }
	                    	   // };
	                    	}));
	                    	
	                    	
	                    }
	                    
	               });              
	            } ,
	        	
	           
	            select: function(event, ui) {
	            	var page = document.getElementById('invoice').value;
	            	window.location = "Invoice/search/" + page;
	            },
	        	
	            
	        
	        }).each(function() {
	            $(this).data('autocomplete')._renderItem = function(ul, item) {
	            	 return $("<li></li>").data("item.autocomplete", item).append(
	            		        "<a><strong>" + item.name + " </strong>" + item.id + "</a>")
	            		    .appendTo(ul);
	            };
	        });
	        
	    });
	});*/
	</script>	

	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right notibar">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-envelope"></i> <i
				class="glyphicon glyphicon-menu-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-messages">
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<strong>John Smith</strong> <span class="pull-right text-muted">
								<em>Yesterday</em>
							</span>
						</div>
						<div>Lorem ipsum dolor sit amet, consectetur adipiscing
							elit. Pellentesque eleifend...</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>Read
							All Messages</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-messages --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-tasks"></i> <i
				class="glyphicon glyphicon-menu-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-tasks">
				<li><a href="#">
						<div>
							<p>
								<strong>Task 1</strong> <span class="pull-right text-muted">40%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="40" aria-valuemin="0"
									aria-valuemax="100" style="width: 40%">
									<span class="sr-only">40% Complete (success)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 2</strong> <span class="pull-right text-muted">20%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
									style="width: 20%">
									<span class="sr-only">20% Complete</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 3</strong> <span class="pull-right text-muted">60%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 4</strong> <span class="pull-right text-muted">80%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
									style="width: 80%">
									<span class="sr-only">80% Complete (danger)</span>
								</div>
							</div>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>See
							All Tasks</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-tasks --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-bell"></i> <i
				class="glyphicon glyphicon-menu-down"></i></i>
		</a>
			<ul class="dropdown-menu dropdown-alerts">
				<li><a href="#">
						<div>
							<i class="fa fa-comment fa-fw"></i> New Comment <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
								class="pull-right text-muted small">12 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-envelope fa-fw"></i> Message Sent <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-tasks fa-fw"></i> New Task <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
								class="pull-right text-muted small">4 minutes ago</span>
						</div>
				</a></li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>See
							All Alerts</strong> <i class="fa fa-angle-right"></i>
				</a></li>
			</ul> <!-- /.dropdown-alerts --></li>
		<!-- /.dropdown -->
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i
				class="glyphicon glyphicon-user"></i> <c:choose>
					<c:when test="${empty sessionScope['user']}">
						${sessionScope['user'].name}
					</c:when>
				</c:choose> <i class="glyphicon glyphicon-menu-down"></i>
		</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="user/profile"><i class="fa fa-user fa-fw"></i>
						User Profile</a></li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li class="divider"></li>
				<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
						Logout</a></li>
			</ul> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">

				<li><a href="dashboard"><i
						class="glyphicon glyphicon-dashboard"></i> Dashboard</a></li>


				<li><a href="Invoice/"><i class="glyphicon glyphicon-tasks"></i>
						Invoices</a></li>
				<li><a href="Category/listCategories"><i
						class="glyphicon glyphicon-tags"></i> Category</a></li>
				<li><a href="#"><i class="glyphicon glyphicon-stats"></i>
						Statistical Data<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="blank.html"> Type 1</a></li>
						<li><a href="login.html">Type 2</a></li>

					</ul> <!-- nav-second-level --></li>

				<!-- <li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
						Charts<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="flot.html">Flot Charts</a></li>
						<li><a href="morris.html">Morris.js Charts</a></li>
					</ul> /.nav-second-level</li> -->

				<!-- <li><a href="#"><i class="fa fa-wrench fa-fw"></i> UI
						Elements<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="panels-wells.html">Panels and Wells</a></li>
						<li><a href="buttons.html">Buttons</a></li>
						<li><a href="notifications.html">Notifications</a></li>
						<li><a href="typography.html">Typography</a></li>
						<li><a href="icons.html"> Icons</a></li>
						<li><a href="grid.html">Grid</a></li>
					</ul> /.nav-second-level</li> -->


				<!-- <li><a href="#"><i class="fa fa-sitemap fa-fw"></i>
						Multi-Level Dropdown<span class="glyphicon glyphicon-menu-down"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">Second Level Item</a></li>
						<li><a href="#">Second Level Item</a></li>
						<li><a href="#">Third Level <span
								class="glyphicon glyphicon-menu-down"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
							</ul> /.nav-third-level</li>
					</ul> /.nav-second-level</li> -->



			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>