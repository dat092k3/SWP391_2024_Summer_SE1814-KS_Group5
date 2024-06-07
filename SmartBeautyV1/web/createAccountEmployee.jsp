<%-- 
    Document   : createAccountEmployee
    Created on : Jun 5, 2024, 9:44:33 PM
    Author     : LENOVO
--%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="Site keywords here">
        <meta name="description" content="#">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Site Title -->
        <title>Sherah - HTML eCommerce Dashboard Template</title>

        <!-- Font -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"> 

        <!-- Fav Icon -->
        <link rel="icon" href="images/dot.png">

        <!-- sherah Stylesheet -->
        <link rel="stylesheet" href="styles/bootstrap.min.css">
        <link rel="stylesheet" href="styles/font-awesome-all.min.css">
        <link rel="stylesheet" href="styles/charts.min.css">
        <link rel="stylesheet" href="styles/datatables.min.css">
        <link rel="stylesheet" href="styles/jvector-map.css">
        <link rel="stylesheet" href="styles/slickslider.min.css">
        <link rel="stylesheet" href="styles/jquery-ui.css">
        <link rel="stylesheet" href="styles/reset.css">
        <link rel="stylesheet" href="styles/style.css">
        <style>
            /* General Styles */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
                color: #333;
            }

            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
            }

            /* Typography */
            h1, h2, h3, h4, h5, h6 {
                color: #222;
                margin-bottom: 20px;
            }

            p {
                line-height: 1.6;
                margin-bottom: 20px;
            }

            /* Forms */
            form {
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            input, select, textarea {
                width: 100%;
                padding: 10px;
                margin: 5px 0 20px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            /* Buttons */
            button {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                background-color: #09AD95;
                color: #fff;
                cursor: pointer;
            }

            button:hover {
                background-color: #008d79;
            }

            /* Flexbox and Grid Layout */
            .flex-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .flex-item {
                flex: 1;
                margin: 10px;
            }

            .grid-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
            }

            /* Other Styles */
            .header, .footer {
                background-color: #333;
                color: #fff;
                padding: 20px 0;
                text-align: center;
            }

            .card {
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

        </style>
    </head>
    <body id="sherah-dark-light">

        <div class="sherah-body-area">
            <!-- sherah Admin Menu -->
            <div class="sherah-smenu">
                <!-- Admin Menu -->
                <div class="admin-menu">

                    <!-- Logo -->
                    <div class="logo sherah-sidebar-padding">
                        <a href="index.jsp">
                            <div class="logo d-flex flex-row align-items-center justify-content-start"><img src="images/dot.png" alt=""><div>Sport<span>fit</span></div></div>
                        </a>
                        <div class="sherah__sicon close-icon d-xl-none">
                            <svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6.19855 7.41927C4.22908 5.52503 2.34913 3.72698 0.487273 1.90989C0.274898 1.70227 0.0977597 1.40419 0.026333 1.11848C-0.0746168 0.717537 0.122521 0.36707 0.483464 0.154695C0.856788 -0.0643475 1.24249 -0.0519669 1.60248 0.199455C1.73105 0.289929 1.84438 0.404212 1.95771 0.514685C4.00528 2.48321 6.05189 4.45173 8.09755 6.4212C8.82896 7.12499 8.83372 7.6145 8.11565 8.30687C6.05856 10.2878 4.00052 12.2677 1.94152 14.2467C1.82724 14.3562 1.71391 14.4696 1.58439 14.5591C1.17773 14.841 0.615842 14.781 0.27966 14.4324C-0.056522 14.0829 -0.0946163 13.5191 0.202519 13.1248C0.296802 12.9991 0.415847 12.8915 0.530129 12.781C2.29104 11.0868 4.05194 9.39351 5.81571 7.70212C5.91761 7.60593 6.04332 7.53355 6.19855 7.41927Z"></path>
                            </svg>		
                        </div>
                    </div>
                    <!-- Main Menu -->
                    <div class="admin-menu__one sherah-sidebar-padding">
                        <!-- Nav Menu -->
                        <div class="menu-bar">
                            <ul class="menu-bar__one sherah-dashboard-menu" id="sherahMenu">
                                <li><a  href="###" data-bs-toggle="collapse" data-bs-target="#menu-item_home"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg  class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg" width="18.075" height="18.075" viewBox="0 0 18.075 18.075">
                                                <g id="Icon" transform="translate(0 0)">
                                                <path id="Path_29" data-name="Path 29" d="M6.966,6.025H1.318A1.319,1.319,0,0,1,0,4.707V1.318A1.319,1.319,0,0,1,1.318,0H6.966A1.319,1.319,0,0,1,8.284,1.318V4.707A1.319,1.319,0,0,1,6.966,6.025ZM1.318,1.13a.188.188,0,0,0-.188.188V4.707a.188.188,0,0,0,.188.188H6.966a.188.188,0,0,0,.188-.188V1.318a.188.188,0,0,0-.188-.188Zm0,0"/>
                                                <path id="Path_30" data-name="Path 30" d="M6.966,223.876H1.318A1.319,1.319,0,0,1,0,222.558V214.65a1.319,1.319,0,0,1,1.318-1.318H6.966a1.319,1.319,0,0,1,1.318,1.318v7.908A1.319,1.319,0,0,1,6.966,223.876Zm-5.648-9.414a.188.188,0,0,0-.188.188v7.908a.188.188,0,0,0,.188.188H6.966a.188.188,0,0,0,.188-.188V214.65a.188.188,0,0,0-.188-.188Zm0,0" transform="translate(0 -205.801)"/>
                                                <path id="Path_31" data-name="Path 31" d="M284.3,347.357H278.65a1.319,1.319,0,0,1-1.318-1.318V342.65a1.319,1.319,0,0,1,1.318-1.318H284.3a1.319,1.319,0,0,1,1.318,1.318v3.389A1.319,1.319,0,0,1,284.3,347.357Zm-5.648-4.9a.188.188,0,0,0-.188.188v3.389a.188.188,0,0,0,.188.188H284.3a.188.188,0,0,0,.188-.188V342.65a.188.188,0,0,0-.188-.188Zm0,0" transform="translate(-267.542 -329.282)"/>
                                                <path id="Path_32" data-name="Path 32" d="M284.3,10.544H278.65a1.319,1.319,0,0,1-1.318-1.318V1.318A1.319,1.319,0,0,1,278.65,0H284.3a1.319,1.319,0,0,1,1.318,1.318V9.226A1.319,1.319,0,0,1,284.3,10.544ZM278.65,1.13a.188.188,0,0,0-.188.188V9.226a.188.188,0,0,0,.188.188H284.3a.188.188,0,0,0,.188-.188V1.318a.188.188,0,0,0-.188-.188Zm0,0" transform="translate(-267.542)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Dashboard</span></span></a></span>

                                </li> 
                                <li><a class="collapsed" href="createAccountEmployee.jsp"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">	
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg" width="22.103" height="22.368" viewBox="0 0 22.103 22.368">
                                                <g id="Icon" transform="translate(0.787 -1.038)">
                                                <g id="setting" transform="translate(-0.787 1.038)">
                                                <path id="Path_39" data-name="Path 39" d="M20.942,9.2h-.094A.71.71,0,0,1,20.359,8l.067-.068a2.209,2.209,0,0,0,0-3.092L19.313,3.715a2.144,2.144,0,0,0-3.055,0l-.067.068a.7.7,0,0,1-.759.145A.713.713,0,0,1,15,3.282v-.1A2.175,2.175,0,0,0,12.838,1H11.264A2.175,2.175,0,0,0,9.1,3.186v.1a.713.713,0,0,1-.435.64.7.7,0,0,1-.754-.142l-.063-.068a2.144,2.144,0,0,0-3.055,0L3.68,4.838a2.209,2.209,0,0,0,0,3.092L3.747,8a.7.7,0,0,1,.136.772.681.681,0,0,1-.629.432H3.16A2.175,2.175,0,0,0,1,11.388V12.98a2.175,2.175,0,0,0,2.16,2.186h.094a.71.71,0,0,1,.489,1.2l-.067.068a2.209,2.209,0,0,0,0,3.092l1.112,1.125a2.144,2.144,0,0,0,3.055,0l.067-.068a.7.7,0,0,1,1.189.5v.1a2.2,2.2,0,0,0,.633,1.549,2.149,2.149,0,0,0,1.53.641h1.574A2.175,2.175,0,0,0,15,21.182v-.1a.713.713,0,0,1,.435-.64.7.7,0,0,1,.754.142l.067.068a2.144,2.144,0,0,0,3.055,0l1.113-1.125a2.209,2.209,0,0,0,0-3.092l-.067-.068a.7.7,0,0,1-.136-.772.681.681,0,0,1,.629-.432h.094A2.175,2.175,0,0,0,23.1,12.98V11.388A2.175,2.175,0,0,0,20.942,9.2Zm.687,3.779a.692.692,0,0,1-.687.695h-.094a2.178,2.178,0,0,0-1.993,1.36,2.223,2.223,0,0,0,.459,2.388l.066.068a.7.7,0,0,1,0,.983L18.267,19.6a.681.681,0,0,1-.971,0l-.066-.068a2.16,2.16,0,0,0-2.36-.463,2.2,2.2,0,0,0-1.345,2.016v.1a.692.692,0,0,1-.687.695H11.264a.692.692,0,0,1-.687-.695v-.1a2.2,2.2,0,0,0-1.342-2.022,2.155,2.155,0,0,0-2.362.47l-.067.068a.682.682,0,0,1-.971,0L4.723,18.476a.7.7,0,0,1,0-.983l.067-.068a2.223,2.223,0,0,0,.459-2.389,2.178,2.178,0,0,0-1.995-1.36H3.16a.692.692,0,0,1-.687-.695V11.388a.692.692,0,0,1,.687-.695h.094a2.178,2.178,0,0,0,1.993-1.36,2.223,2.223,0,0,0-.459-2.388l-.066-.068a.7.7,0,0,1,0-.983L5.835,4.767a.681.681,0,0,1,.971,0l.066.068a2.16,2.16,0,0,0,2.36.464,2.2,2.2,0,0,0,1.345-2.017v-.1a.692.692,0,0,1,.687-.695h1.574a.692.692,0,0,1,.687.695v.1A2.2,2.2,0,0,0,14.869,5.3a2.159,2.159,0,0,0,2.36-.464l.067-.068a.681.681,0,0,1,.971,0L19.38,5.893a.7.7,0,0,1,0,.983l-.067.068a2.223,2.223,0,0,0-.459,2.389,2.178,2.178,0,0,0,1.994,1.36h.094a.692.692,0,0,1,.687.695Z" transform="translate(-1 -1)"/>
                                                <path id="Path_40" data-name="Path 40" d="M13.965,9a4.965,4.965,0,1,0,4.965,4.965A4.965,4.965,0,0,0,13.965,9Zm0,8.511a3.546,3.546,0,1,1,3.546-3.546,3.546,3.546,0,0,1-3.546,3.546Z" transform="translate(-2.913 -2.781)"/>
                                                </g>
                                                </g>
                                                </svg>											  
                                            </span>
                                            <span class="menu-bar__name">Create account for employee </span></span></a></span>
                                </li>
                                <li><a class="collapsed" href="languages.html"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">	
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg" width="20.929" height="20.929" viewBox="0 0 20.929 20.929">
                                                <g id="Icon" transform="translate(-466.296 -331.887)">
                                                <path id="Path_237" data-name="Path 237" d="M487.224,344.233q0,3.248,0,6.5a1.878,1.878,0,0,1-2.1,2.087q-4.739,0-9.477,0a1.868,1.868,0,0,1-2.1-1.806c-.075-.511-.157-1.024-.193-1.539-.021-.3-.131-.382-.424-.379-1.484.014-2.968.008-4.453.006a1.906,1.906,0,0,1-2.181-2.172q0-6.434,0-12.868a1.9,1.9,0,0,1,2.181-2.17q2.859,0,5.719,0a1.866,1.866,0,0,1,2.1,1.806,14.575,14.575,0,0,1,.182,1.457c.017.375.162.464.519.462q4.024-.021,8.048,0a3.22,3.22,0,0,1,1,.137,1.8,1.8,0,0,1,1.176,1.826C487.227,339.794,487.224,342.013,487.224,344.233Zm-11.569,7.355h9.506c.65,0,.835-.192.835-.863q0-6.514,0-13.028c0-.68-.182-.859-.88-.859q-3.982,0-7.964,0c-.144,0-.288.015-.425.023a.848.848,0,0,0-.011.127c.458,3.7.909,7.4,1.385,11.1a1.18,1.18,0,0,1-.306,1.037C477.09,349.907,476.409,350.715,475.655,351.587Zm1.163-3.721c-.012-.134-.016-.2-.024-.266q-.386-3.119-.772-6.237-.469-3.766-.945-7.532c-.072-.567-.261-.715-.835-.715q-2.9,0-5.8,0c-.75,0-.918.165-.918.9q0,6.453,0,12.906c0,.793.151.942.962.943h8.332Zm-.665,1.264h-1.607l.209,1.618Z"/>
                                                <path id="Path_238" data-name="Path 238" d="M619.993,436.215c-.42.342-.828.68-1.241,1.009-.468.372-.808.391-1.068.07s-.159-.66.3-1.026c.381-.3.756-.617,1.09-.89-.411-.766-.816-1.484-1.184-2.22-.137-.274-.175-.555-.58-.611-.293-.041-.407-.342-.354-.647a.556.556,0,0,1,.563-.5c.462-.019.926-.008,1.389-.009h.449c.073-.5-.127-1.188.624-1.2.785-.014.59.687.652,1.2.561,0,1.1,0,1.646,0,.476,0,.749.19.769.549a.605.605,0,0,1-.6.684.369.369,0,0,0-.21.193c-.421.832-.833,1.669-1.284,2.579.322.263.738.608,1.16.945a.662.662,0,0,1,.308.738.605.605,0,0,1-.987.283C620.946,437,620.479,436.606,619.993,436.215Zm-.082-1.845h.17l.967-1.734h-2.1Z" transform="translate(-138.331 -90.271)"/>
                                                <path id="Path_239" data-name="Path 239" d="M506.151,389.753c-.127.617-.247,1.215-.374,1.811-.1.47-.378.7-.743.628-.383-.076-.547-.407-.449-.9q.558-2.8,1.115-5.6c.148-.743.272-.837,1.04-.843,1.426-.012,1.361-.056,1.638,1.356.333,1.7.675,3.389,1.013,5.083.1.5-.058.825-.439.906s-.651-.156-.757-.659-.194-1.016-.318-1.517a.4.4,0,0,0-.272-.25C507.132,389.738,506.656,389.753,506.151,389.753Zm1.429-1.249c-.151-.77-.3-1.515-.449-2.258-.013-.062-.093-.109-.142-.163-.049.054-.129.1-.142.164-.154.743-.3,1.487-.448,2.257Z" transform="translate(-35.134 -48.626)"/>
                                                </g>
                                                </svg>														
                                            </span>
                                            <span class="menu-bar__name">Language</span></span></a></span>
                                </li>
                            </ul>
                        </div>
                        <!-- End Nav Menu -->
                    </div>

                </div>
                <!-- End Admin Menu -->
            </div>
            <!-- End sherah Admin Menu -->

            <!-- Start Header -->
            <header class="sherah-header">
                <div class="container g-0">
                    <div class="row g-0">
                        <div class="col-12">
                            <!-- Dashboard Header -->
                            <div style="margin-left: 60%" class="sherah-header__inner">
                                <div class="sherah-header__middle">
                                    <div class="sherah__sicon close-icon d-xl-none">
                                        <svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M6.19855 7.41927C4.22908 5.52503 2.34913 3.72698 0.487273 1.90989C0.274898 1.70227 0.0977597 1.40419 0.026333 1.11848C-0.0746168 0.717537 0.122521 0.36707 0.483464 0.154695C0.856788 -0.0643475 1.24249 -0.0519669 1.60248 0.199455C1.73105 0.289929 1.84438 0.404212 1.95771 0.514685C4.00528 2.48321 6.05189 4.45173 8.09755 6.4212C8.82896 7.12499 8.83372 7.6145 8.11565 8.30687C6.05856 10.2878 4.00052 12.2677 1.94152 14.2467C1.82724 14.3562 1.71391 14.4696 1.58439 14.5591C1.17773 14.841 0.615842 14.781 0.27966 14.4324C-0.056522 14.0829 -0.0946163 13.5191 0.202519 13.1248C0.296802 12.9991 0.415847 12.8915 0.530129 12.781C2.29104 11.0868 4.05194 9.39351 5.81571 7.70212C5.91761 7.60593 6.04332 7.53355 6.19855 7.41927Z"></path>
                                        </svg>		
                                    </div>
                                    <div class="sherah-header__right">
                                        <div class="sherah-header__group">
                                            <div class="sherah-header__group-two">
                                                <div class="sherah-header__right">
                                                    <!-- Dark Light Button -->
                                                    <div class="sherah-dark-light">
                                                        <button id="sherah-dark-light-button">
                                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="26.536" height="26" viewBox="0 0 26.536 26">
                                                            <g id="Dark_Mode" data-name="Dark Mode" transform="translate(-1351 -10)">
                                                            <path id="Path_202" data-name="Path 202" d="M594.155,374.829a13.6,13.6,0,0,1-13.389-10.869,13.342,13.342,0,0,1,8.489-15.023,1.7,1.7,0,0,1,1.043-.046c.469.157.544.607.329,1.261a11.416,11.416,0,0,0-.031,7.256,11.91,11.91,0,0,0,14.791,7.568,1.176,1.176,0,0,1,.419-.123,2.437,2.437,0,0,1,1,.225c.336.219.294.618.154.99a13.232,13.232,0,0,1-4.448,5.959A13.7,13.7,0,0,1,594.155,374.829Zm-5.676-23.567a11.308,11.308,0,0,0-6.129,11.066,11.858,11.858,0,0,0,22.164,4.683,13.647,13.647,0,0,1-12.229-3.694A13.113,13.113,0,0,1,588.48,351.262Z" transform="translate(770.469 -338.829)"/>
                                                            </g>
                                                            </svg>																													
                                                        </button>
                                                    </div>
                                                    <!-- End Dark Light Button -->
                                                    <!-- Header Zoom -->
                                                    <div class="sherah-header__zoom">
                                                        <button id="sherah-header__full">
                                                            <svg class="sherah-offset__fill" xmlns="http://www.w3.org/2000/svg" width="33.674" height="26" viewBox="0 0 33.674 26">
                                                            <g id="Full_Screen_Icon" data-name="Full Screen Icon" transform="translate(-732.046 -400.487)">
                                                            <path id="Path_198" data-name="Path 198" d="M734.468,402.9c0,1.589,0,3.064,0,4.539,0,.947-.452,1.483-1.213,1.477s-1.189-.535-1.192-1.5q-.008-2.7,0-5.406c0-1.093.411-1.513,1.481-1.517q2.741-.011,5.481,0c.937,0,1.476.467,1.459,1.23-.016.734-.537,1.168-1.441,1.173C737.547,402.907,736.05,402.9,734.468,402.9Z" transform="translate(-0.01 -0.003)"/>
                                                            <path id="Path_199" data-name="Path 199" d="M906.056,402.9c-1.6,0-3.078.005-4.554,0-.94,0-1.477-.464-1.463-1.226.014-.736.534-1.173,1.436-1.177q2.778-.011,5.556,0c.982,0,1.422.442,1.428,1.42q.015,2.816,0,5.632c-.005.844-.456,1.351-1.169,1.369-.743.018-1.225-.506-1.232-1.381C906.048,406.013,906.056,404.493,906.056,402.9Z" transform="translate(-142.747 0)"/>
                                                            <path id="Path_200" data-name="Path 200" d="M734.458,526.491c1.593,0,3.068,0,4.543,0,.945,0,1.481.455,1.473,1.216s-.539,1.186-1.5,1.188q-2.741.008-5.481,0c-.988,0-1.432-.439-1.438-1.41q-.016-2.815,0-5.631c0-.874.491-1.4,1.234-1.38.712.019,1.16.526,1.166,1.371C734.466,523.367,734.458,524.888,734.458,526.491Z" transform="translate(0 -102.415)"/>
                                                            <path id="Path_201" data-name="Path 201" d="M906.057,526.44c0-1.5,0-2.974,0-4.445,0-.968.419-1.5,1.171-1.52.781-.02,1.232.531,1.234,1.531q.007,2.7,0,5.406c0,1.067-.429,1.481-1.516,1.485q-2.7.009-5.406,0c-.962,0-1.492-.431-1.5-1.19s.528-1.21,1.474-1.215c1.427-.007,2.853,0,4.28-.007A2.365,2.365,0,0,0,906.057,526.44Z" transform="translate(-142.748 -102.415)"/>
                                                            </g>
                                                            </svg>														  
                                                        </button>
                                                    </div>
                                                    <!-- End Header Zoom -->
                                                    <!-- Header Author -->
                                                    <div class="sherah-header__author sherah-flex__center--top">
                                                        <div class="sherah-header__author-img">
                                                            <img src="images/truong.jpg" alt="#">
                                                        </div>
                                                        <div class="sherah-header__author--info sherah-dflex sherah-dflex__base">
                                                            <h4 class="sherah-header__author--title  sherah-dflex sherah-dflex__column">${sessionScope.account.username}
                                                                <svg class="sherah-default__fill sherah-default__arrow" xmlns="http://www.w3.org/2000/svg" width="10.621" height="5.836" viewBox="0 0 10.621 5.836">
                                                                <g id="Arrow_Icon" data-name="Arrow Icon" transform="translate(1599.621 7.836) rotate(180)">
                                                                <path id="Path_193" data-name="Path 193" d="M607.131,421.81c-.063.06-.118.11-.171.163q-2.071,2.065-4.144,4.127a.91.91,0,0,1-.36.224.5.5,0,0,1-.553-.234.519.519,0,0,1,.042-.618,2.213,2.213,0,0,1,.171-.181l4.523-4.51c.368-.367.617-.367.987,0l4.538,4.525a1.725,1.725,0,0,1,.168.183.521.521,0,0,1-.052.7.533.533,0,0,1-.7.039,1.815,1.815,0,0,1-.166-.156l-4.112-4.1C607.249,421.919,607.193,421.869,607.131,421.81Z" transform="translate(987.179 -418.507)"/>
                                                                </g>
                                                                </svg>
                                                        </div>
                                                        <!-- sherah Profile Hover -->
                                                        <div class="sherah-dropdown-card sherah-dropdown-card__profile sherah-border">
                                                            <svg class="sherah-dropdown-arrow" xmlns="http://www.w3.org/2000/svg" width="43.488" height="22.207" viewBox="0 0 43.488 22.207">
                                                            <path id="Path_1271" data-name="Path 1271" d="M-15383,7197.438l20.555-20.992,20.555,20.992Z" transform="translate(15384.189 -7175.73)" stroke-width="1"></path>
                                                            </svg>
                                                            <h3 class="sherah-dropdown-card__title sherah-border-btm">My Profile</h3>
                                                            <!-- sherah Balance List -->
                                                            <ul class="sherah-dropdown-card_list">
                                                                <li>
                                                                    <div class="sherah-dropdown-card-info">
                                                                        <div class="sherah-dropdown-card__img sherah-color1__bg">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="18.192" height="21.5" viewBox="0 0 18.192 21.5">
                                                                            <g id="user_account_people_man" data-name="user, account, people, man" transform="translate(-5 -3)">
                                                                            <path id="Path_1272" data-name="Path 1272" d="M20.494,16.131a.827.827,0,1,0-1.163,1.176,7.391,7.391,0,0,1,2.207,5.29c0,1.011-2.9,2.481-7.442,2.481S6.654,23.607,6.654,22.6a7.391,7.391,0,0,1,2.179-5.261.827.827,0,1,0-1.169-1.169A9.036,9.036,0,0,0,5,22.6c0,2.686,4.686,4.135,9.1,4.135s9.1-1.449,9.1-4.135a9.03,9.03,0,0,0-2.7-6.466Z" transform="translate(0 -2.231)" fill="#fff"/>
                                                                            <path id="Path_1273" data-name="Path 1273" d="M14.788,14.577A5.788,5.788,0,1,0,9,8.788,5.788,5.788,0,0,0,14.788,14.577Zm0-9.923a4.135,4.135,0,1,1-4.135,4.135,4.135,4.135,0,0,1,4.135-4.135Z" transform="translate(-0.692)" fill="#fff"/>
                                                                            </g>
                                                                            </svg>

                                                                        </div>
                                                                        <h4 class="sherah-dropdown-card-name"><a href="###">My Profile</a></h4>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <div class="sherah-dropdown-card-info">
                                                                        <div class="sherah-dropdown-card__img sherah-color1__bg">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="17.5" height="17.5" viewBox="0 0 17.5 17.5">
                                                                            <path id="path52" d="M9.27,291.179a.877.877,0,0,0-.867.889V299.1a.876.876,0,1,0,1.752,0v-7.033a.877.877,0,0,0-.885-.889Zm5.105,1.763c-.028,0-.057,0-.085,0A.88.88,0,0,0,13.8,294.5a7,7,0,1,1-9.076.026.882.882,0,0,0,.1-1.239.873.873,0,0,0-1.234-.1,8.815,8.815,0,0,0,5.691,15.495,8.815,8.815,0,0,0,5.652-15.521.873.873,0,0,0-.561-.216Z" transform="translate(-0.529 -291.179)" fill="#fff"/>
                                                                            </svg>
                                                                        </div>
                                                                        <h4 class="sherah-dropdown-card-name"><a href="logout">Logout</a></h4>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <!-- End sherah Balance Hover -->
                                                    </div>
                                                    <!-- End Header Author -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- End Header -->

            <!-- sherah Dashboard -->
            <section class="sherah-adashboard sherah-show">
                <div class="container">
                    <div style="color: green" class="row">	
                        <div class="col-12 sherah-main__column">
                            <h2>Create account Employee</h2>
                            <form action="createemployee" method="post" enctype="multipart/form-data">
                                <label for="accountId">Account ID:</label>
                                <input type="text" id="accountId" name="accountId" required><br>

                                <label for="name">Full name: </label>
                                <input type="text" id="name" name="name" required><br>

                                <label for="department">Department: </label>
                                <select id="department" name="department" required>
                                    <option value="">Choose department</option>
                                    <option value="HR">Human resource</option>
                                    <option value="IT">Admin</option>
                                    <option value="Trainer">PT</option>
                                </select><br>

                                <label for="position">Position: </label>
                                <select id="position" name="position" required>
                                    <option value="">Choose position</option>
                                    <option value="takecare">Take care</option>
                                    <option value="trainer">PT</option>
                                    <option value="admin">admin</option>
                                </select><br>

                                <label for="dateOfBirth">Date Of Birth</label>
                                <input type="date" id="dateOfBirth" name="dateOfBirth" required><br>

                                <label for="hireDate">Hire Date</label>
                                <input type="date" id="hireDate" name="hireDate" required><br>

                                <label for="image">Image</label>
                                <input type="file" id="image" name="image" accept="image/*" required><br>

                                <label for="password">Password: </label>
                                <input type="password" id="password" name="password" required><br>

                                <input style="background-color: green" type="submit" value="Create">
                                <input type="reset" value="Cancel">
                            </form>
                        </div>
                    </div>	
                </div>	
            </section>	
            <!-- End sherah Dashboard -->
        </div>

        <!-- Sherah Scripts -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/charts.js"></script>
        <script src="js/datatables.min.js"></script> 
        <script src="js/circle-progress.min.js"></script>
        <script src="js/jquery-jvectormap.js"></script>
        <script src="js/jvector-map.js"></script>
        <script src="js/slickslider.min.js"></script>
        <script src="js/main.js"></script>

        <script>
            $(document).ready(function () {


                $('#sherah-map').vectorMap({
                    map: 'world_mill_en',
                    backgroundColor: 'transparent',
                    panControl: false,
                    zoomControl: false,
                    regionStyle: {
                        initial: {
                            fill: '#C5C5C5'
                        },
                        hover: {
                            fill: '#09AD95'
                        }
                    },
                    showTooltip: true,

                });

            });


            $(".sherah-product-slider").slick({
                autoplay: false,
                speed: 800,
                autoplaySpeed: 3500,
                slidesToShow: 4,
                pauseOnHover: true,
                dots: false,
                center: true,
                arrows: true,
                cssEase: 'ease',
                margin: 30,
                speed: 700,
                draggable: true,
                prevArrow: '<button class="Prev"><i class="fa-solid fa-angle-left"></i></button>',
                nextArrow: '<button class="Next"><i class="fa-solid fa-angle-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 2000,
                        settings: {
                            slidesToShow: 6,
                        }
                    },
                    {
                        breakpoint: 1600,
                        settings: {
                            slidesToShow: 4,
                        }
                    },
                    {
                        breakpoint: 800,
                        settings: {
                            slidesToShow: 3,
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 3,
                        }
                    },
                    {
                        breakpoint: 500,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                ]
            });


        </script>

        <script>
            new CircleProgress('.circle__one', {
                max: 100,
                value: 60,

            });

            new CircleProgress('.circle__two', {
                max: 100,
                value: 60,

            });
        </script>
        <script>
            // Chart One
            const ctx = document.getElementById('myChart_one_monthly').getContext('2d');
            const myChart_one_monthly = new Chart(ctx, {
                type: 'bar',

                data: {
                    labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
                    datasets: [{
                            label: 'Profit',
                            data: [90, 60, 85, 40, 75, 45, 95, 75, 45, 65, 35, 90, 40, 50, 30, 70],
                            backgroundColor: [
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                                '#F9C200',
                            ],
                            fill: true,
                            tension: 0.4,
                            borderWidth: 0,
                            borderSkipped: false,
                            borderRadius: 4,
                            barPercentage: 0.7,
                            categoryPercentage: 0.5,
                        }, {
                            label: 'Profit',
                            data: [85, 55, 80, 45, 70, 50, 90, 60, 55, 60, 45, 85, 50, 60, 40, 65],
                            backgroundColor: [
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                                '#6176FE',
                            ],
                            fill: true,
                            tension: 0.4,
                            borderWidth: 0,
                            borderSkipped: false,
                            borderRadius: 4,
                            barPercentage: 0.7,
                            categoryPercentage: 0.5,
                        }, {
                            label: 'Profit',
                            data: [90, 60, 85, 40, 75, 45, 95, 75, 45, 65, 35, 90, 40, 50, 30, 90],
                            backgroundColor: [
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                                '#09AD95',
                            ],
                            fill: true,
                            tension: 0.4,
                            borderWidth: 0,
                            borderSkipped: false,
                            borderRadius: 4,
                            barPercentage: 0.7,
                            categoryPercentage: 0.5,
                        },
                    ]
                },
                options: {
                    intersect: false,
                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            ticks: {
                            },
                            grid: {
                                display: false,
                            },

                        },
                        y: {
                            ticks: {
                                callback: function (value, index, values) {
                                    return value + '%';
                                }
                            },
                            grid: {
                                drawBorder: false,
                                color: '#c5c5c573',
                                borderDash: [10, 10]
                            },
                        },

                    },
                    plugins: {
                        tooltip: {
                            padding: 10,
                            displayColors: true,
                            yAlign: 'bottom',
                            backgroundColor: '#fff',
                            titleColor: '#000',
                            titleFont: {weight: 'normal'},
                            bodyColor: '#2F3032',
                            cornerRadius: 12,
                            font: {
                                size: 14
                            },
                            caretSize: 9,
                            bodySpacing: 100,

                        },
                        legend: {
                            position: 'top',
                            display: false,
                        },
                        title: {
                            display: false,
                            text: 'Sell History'
                        }
                    }
                }
            });
            setInterval(() => {
                if (document.body.classList.contains('active')) {
                    myChart_one_monthly.options.scales.y.grid.color = '#E2E7F11C ';
                } else {
                    myChart_one_monthly.options.scales.y.grid.color = '#c5c5c573 ';
                }
                myChart_one_monthly.update();
            }, 500);


            // Chart Two
            const ctx_two = document.getElementById('myChart_Total_Sales_Home').getContext('2d');

            const gradientBg = ctx_two.createLinearGradient(0, 0, 0, 190);

            gradientBg.addColorStop(0, 'rgba(97, 118, 254, 0.43)');
            gradientBg.addColorStop(1, 'rgba(97, 118, 254, 0)');
            const myChart_Total_Sales_Home = new Chart(ctx_two, {
                type: 'line',

                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                            label: 'Visitor',
                            data: [20, 15, 35, 45, 60, 45, 70, 50, 70, 70, 44, 50],
                            backgroundColor: gradientBg,
                            borderColor: '#6176FE',
                            pointRadius: 0,
                            tension: 0.5,
                            borderWidth: 6,
                            fill: true,
                            fillColor: '#fff',
                        }]
                },

                options: {

                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            grid: {
                                display: true,
                                color: '#c5c5c573',
                            },
                            suggestedMax: 80, suggestedMin: 80,

                        },
                        y: {
                            suggestedMax: 80, suggestedMin: 80,
                            grid: {
                                display: true,

                                color: '#c5c5c573',
                                borderDash: [10, 10]
                            },
                        },
                    },

                    plugins: {
                        legend: {
                            position: 'bottom',
                            display: false,
                        },
                        title: {
                            display: false,
                        }
                    }
                }
            });

            setInterval(() => {
                if (document.body.classList.contains('active')) {
                    myChart_Total_Sales_Home.options.scales.x.grid.color = '#E2E7F11C ';
                    myChart_Total_Sales_Home.options.scales.y.grid.color = '#E2E7F11C ';
                } else {
                    myChart_Total_Sales_Home.options.scales.x.grid.color = '#c5c5c573 ';
                    myChart_Total_Sales_Home.options.scales.y.grid.color = '#c5c5c573 ';
                }
                myChart_Total_Sales_Home.update();
            }, 500);

            // Chart Revenue
            const ctx_market = document.getElementById('myChart_Revenue').getContext('2d');

            const myChart_Revenue = new Chart(ctx_market, {
                type: 'line',

                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                            label: 'Visitor',
                            data: [10, 15, 15, 90, 90, 45, 45, 45, 70, 70, 45, 45],
                            backgroundColor: 'transparent',
                            borderColor: '#F2C94C',
                            borderWidth: 5,
                            fill: true,
                            fillColor: '#fff',
                            tension: 0.5,
                            pointRadius: 0,
                        },
                        {
                            label: 'Sells',
                            data: [20, 86, 79, 30, 60, 45, 70, 50, 70, 30, 44, 50],
                            backgroundColor: 'transparent',
                            borderColor: '#09AD95',
                            borderWidth: 5,
                            fill: true,
                            tension: 0.5,
                            fillColor: '#fff',
                            fill: 'start',
                            pointRadius: 0,
                        },
                        {
                            label: 'Profit',
                            data: [20, 20, 79, 80, 60, 45, 70, 30, 20, 90, 44, 50],
                            backgroundColor: 'transparent',
                            borderColor: '#6176FE',
                            borderWidth: 5,
                            fill: true,
                            tension: 0.5,
                            fillColor: '#fff',
                            fill: 'start',
                            pointRadius: 0,
                        }]
                },

                options: {
                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            grid: {
                                display: true,
                                color: '#c5c5c573',
                            },
                            suggestedMax: 100, suggestedMin: 100,

                        },
                        y: {
                            suggestedMax: 100, suggestedMin: 100,
                            grid: {
                                display: true,

                                color: '#c5c5c573',
                                borderDash: [10, 10]
                            },
                        },
                    },
                    plugins: {
                        legend: {
                            position: 'top',
                            display: false,
                        },
                        title: {
                            display: false,
                            text: 'Sell History'
                        }
                    }
                }
            });

            setInterval(() => {
                if (document.body.classList.contains('active')) {
                    myChart_Revenue.options.scales.y.grid.color = '#E2E7F11C ';
                    myChart_Revenue.options.scales.x.grid.color = '#E2E7F11C ';
                } else {
                    myChart_Revenue.options.scales.y.grid.color = '#c5c5c573 ';
                    myChart_Revenue.options.scales.x.grid.color = '#c5c5c573 ';
                }
                myChart_Revenue.update();
            }, 500);




            // Chart Seven
            const ctx_total_clients = document.getElementById('myChart_active_creators').getContext('2d');

            const myChart_active_creators = new Chart(ctx_total_clients, {
                type: 'line',

                data: {
                    labels: ['1', '2', '3', '4', '5'],
                    datasets: [{
                            label: 'Total Clients',
                            data: [0, 10, 15, 10, 20],
                            borderColor: '#F9C200',
                            backgroundColor: 'transparent',
                            pointRadius: 0,
                            tension: 0.5,
                            borderWidth: 7,
                            fill: true,
                            fillColor: '#fff',
                        }]
                },

                options: {

                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },
                            ticks: {
                                display: false
                            },
                            suggestedMax: 10, suggestedMin: 30,

                        },

                        y: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },
                            ticks: {
                                display: false
                            },
                            suggestedMax: 10, suggestedMin: 30,
                        },
                    },

                    plugins: {
                        legend: {
                            display: false,
                        },
                        title: {
                            display: false,
                        }
                    }
                }
            });

            const ctx_recent_orders = document.getElementById('myChart_recent_orders').getContext('2d');

            const myChart_recent_orders = new Chart(ctx_recent_orders, {
                type: 'line',

                data: {
                    labels: ['1', '2', '3', '4', '5'],
                    datasets: [{
                            label: 'Total Clients',
                            data: [0, 10, 15, 10, 20],
                            borderColor: '#09AD95',
                            backgroundColor: 'transparent',
                            pointRadius: 0,
                            tension: 0.5,
                            borderWidth: 7,
                            fill: true,
                            fillColor: '#fff',
                        }]
                },

                options: {

                    maintainAspectRatio: false,
                    responsive: true,
                    scales: {
                        x: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },
                            ticks: {
                                display: false
                            },
                            suggestedMax: 10, suggestedMin: 30,

                        },

                        y: {
                            grid: {
                                display: false,
                                drawBorder: false,
                            },
                            ticks: {
                                display: false
                            },
                            suggestedMax: 10, suggestedMin: 30,
                        },
                    },

                    plugins: {
                        legend: {
                            display: false,
                        },
                        title: {
                            display: false,
                        }
                    }
                }
            });
        </script>
    </body>
</html>
