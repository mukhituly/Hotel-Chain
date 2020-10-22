<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <base href="${pageContext.request.contextPath}">
        <title>Hotel chain</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.8/slick.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.8/slick-theme.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.14.0/js/all.js"></script>
        <script defer src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.8/slick.min.js"></script>


        <style>
            #headerCarousel {
                width: 100%;
                height: 100vh;
            }

            #headerCarousel img {
                height: 100%;
            }

            .header {
                position: relative;
            }

            .searchHotel {
                position: absolute;
                bottom: 96px;
                box-shadow: rgba(0, 0, 0, 0.08) 0px 1px 20px;
                background-color: #fff;
                z-index: 1;
                width: calc(100vw - 360px);
                margin-left: 180px;
                margin-right: 180px;
                padding: 28px 30px;
                border-radius: 8px;
            }


            .modal-background {
                background-color: rgba(10, 10, 10, .86);
            }

            .wrapper{
                width:100%;
                padding-top: 20px;
                text-align:center;
            }

            .carousel{
                width:90%;
                margin:0px auto;
            }

            .cityItem {
                position: relative;
                border-radius: 6px;
            }

            .cityItem .content {
                position: absolute;
                width: 100%;
                height: 100%;
                top: 0px;
                left: 0px;
                display: flex;
                flex-direction: column;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                background-color: rgba(0, 0, 0, 0.4);
                z-index: 2;
                border-radius: 6px;
                border: none;
            }

            .cityItem .content h3 {
                color: #fff;
            }

            .slick-slide{
                margin:10px;
            }

            .slick-prev:before, .slick-next:before {
                color: #00d1b2 !important;
            }
            .slick-slide img {
                width:100%;
                border-radius: 6px;
            }

            .is-hidden {
                display: none;
            }
        </style>
    </head>
    <body>

        <!-- Navigation bar -->
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a class="navbar-item" href="https://bulma.io">
                    <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
                </a>

                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                    <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <a class="navbar-item">
                        Home
                    </a>

                    <a class="navbar-item">
                        Documentation
                    </a>

                    <div class="navbar-item has-dropdown is-hoverable">
                        <a class="navbar-link">
                            More
                        </a>

                        <div class="navbar-dropdown">
                            <a class="navbar-item">
                                About
                            </a>
                            <a class="navbar-item">
                                Jobs
                            </a>
                            <a class="navbar-item">
                                Contact
                            </a>
                            <hr class="navbar-divider">
                            <a class="navbar-item">
                                Report an issue
                            </a>
                        </div>
                    </div>
                </div>

                <div class="navbar-end">
                    <div class="navbar-item">
                        <div class="buttons">
                            <a href="auth" class="button is-primary">
                                <strong>Sign up</strong>
                            </a>
                            <a class="button is-light toggleLogin">
                                Log in
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Login modal -->
        <div id="loginModal" class="modal">
            <div class="modal-background"></div>
            <div class="modal-card">
                <header class="modal-card-head">
                    <p class="modal-card-title">Login</p>
                    <button class="delete toggleLogin" aria-label="close"></button>
                </header>
                <section class="modal-card-body">
                    <div class="field">
                        <label class="label">Username</label>
                        <div class="control has-icons-left has-icons-right">
                            <input id="username" class="input" type="text" placeholder="Username">
                            <span class="icon is-small is-left">
                                <i class="fas fa-user"></i>
                            </span>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Password</label>
                        <div class="control has-icons-left has-icons-right">
                            <input id="password" class="input" type="password" placeholder="Password">
                            <span class="icon is-small is-left">
                                <i class="fas fa-lock"></i>
                            </span>
                        </div>
                    </div>

                    <div id="loginNotification" class="notification is-light is-hidden"></div>
                </section>
                <footer class="modal-card-foot">
                    <button class="button loginButton">Login</button>
                    <button class="button toggleLogin">Cancel</button>
                </footer>
            </div>
        </div>


        <div class="header">
            <div id="headerCarousel">
                <img src="https://tripfinder-redq.firebaseapp.com/static/media/3.b9923e48.jpg" alt="...">
            </div>

            <div class="searchHotel">
                <h3 class="title">Best hotels. Lowest prices.</h3>
                <p class="subtitle is-6">compares prices from 200+ booking sites to help you find the lowest price on the right hotel for you.</p>
                <form>
                    <div class="columns is-variable is-1">
                        <div class="column is-6 field">
                            <p class="control has-icons-left">
                                <input type="text" class="input" placeholder="Search location">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-map-marker-alt"></i>
                                </span>
                            </p>
                        </div>
                        <div class="column field">
                            <p class="control has-icons-left">
                                <input type="text" class="input" placeholder="Start date">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-calendar-alt"></i>
                                </span>
                            </p>
                        </div>
                        <div class="column field">
                            <p class="control has-icons-left">
                                <input type="text" class="input" placeholder="End date">
                                <span class="icon is-small is-left">
                                    <i class="fas fa-calendar-alt"></i>
                                </span>
                            </p>
                        </div>
                        <div class="column is-1">
                            <button class="button is-primary">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Cities list -->
<%--        <section class="section">--%>
<%--            <div class="container">--%>
<%--                <h1 class="title">Explore destinations</h1>--%>
<%--            </div>--%>

<%--            <div class="wrapper">--%>
<%--                <div class="carousel">--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="cityItem">--%>
<%--                        <img src="http://s3.amazonaws.com/redqteam.com/tripfinder-images/rome.jpg" />--%>
<%--                        <div class="content">--%>
<%--                            <h3 class="title is-4">Rome</h3>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>

        <!-- Top hotels -->
        <section class="section">
            <div class="container">
                <h1 class="title">Travelers’ Choice: Top hotels</h1>


                <div class="columns is-multiline">
                    <div class="column is-3">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-3by2">
                                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="content">
                                    <h5 class="title is-5">Incredible Granite Chicken</h5>
                                    <p class="subtitle is-6" style="margin-bottom: 6px;">$191.00/Night - Free Cancellation</p>
                                    <small>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="far fa-star has-text-warning"></i>
                                        <strong>Good (123)</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-3by2">
                                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="content">
                                    <h5 class="title is-5">Incredible Granite Chicken</h5>
                                    <p class="subtitle is-6" style="margin-bottom: 6px;">$191.00/Night - Free Cancellation</p>
                                    <small>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="far fa-star has-text-warning"></i>
                                        <strong>Good (123)</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-3by2">
                                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="content">
                                    <h5 class="title is-5">Incredible Granite Chicken</h5>
                                    <p class="subtitle is-6" style="margin-bottom: 6px;">$191.00/Night - Free Cancellation</p>
                                    <small>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="far fa-star has-text-warning"></i>
                                        <strong>Good (123)</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-3by2">
                                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="content">
                                    <h5 class="title is-5">Incredible Granite Chicken</h5>
                                    <p class="subtitle is-6" style="margin-bottom: 6px;">$191.00/Night - Free Cancellation</p>
                                    <small>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="far fa-star has-text-warning"></i>
                                        <strong>Good (123)</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="card">
                            <div class="card-image">
                                <figure class="image is-3by2">
                                    <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
                                </figure>
                            </div>
                            <div class="card-content">
                                <div class="content">
                                    <h5 class="title is-5">Incredible Granite Chicken</h5>
                                    <p class="subtitle is-6" style="margin-bottom: 6px;">$191.00/Night - Free Cancellation</p>
                                    <small>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="fas fa-star has-text-warning"></i>
                                        <i class="far fa-star has-text-warning"></i>
                                        <strong>Good (123)</strong>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>


        <!-- Best rated hotels -->
        <section class="section">
            <div class="container">
                <h1 class="title">Best Rated: Luxary hotels</h1>
            </div>
        </section>




    </body>
    <script>
        $(document).ready(function () {
            $(".carousel").slick({
                slidesToShow: 4,
                dots: true,
                centerMode: true,
                autoplay: true
            });

            $(".loginButton").on('click', function () {
                loginUser();
            });

            $(".toggleLogin").on('click', function () {
                toggleLoginModal();
            });
        });


        function loginUser() {
            const username = $("#username").val();
            const password = $("#password").val();
            $.post("auth?auth=login", { username: username, password: password }, function(res) {
                $("#loginNotification").html(res.message);
                $("#loginNotification").removeClass("is-hidden");
                if (res.status !== "success") {
                    $("#loginNotification").removeClass("is-success");
                    $("#loginNotification").addClass("is-danger");
                } else {
                    $("#loginNotification").addClass("is-success");
                    $("#loginNotification").removeClass("is-danger");
                    setTimeout(function () {
                        toggleLoginModal();
                    }, 1500);
                }
            });
        }

        function toggleLoginModal() {
            $("#loginModal").toggleClass("is-active");
        }
    </script>
</html>