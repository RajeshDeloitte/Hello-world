/**
 * Community template
 *
 * Stylesheet for Header, Footer and home page components in Community template.
 *
 *
 * Elements in stylesheet
 *     Header
 *          - Header container
 *          - Header top links
 *          - Header banner image
 *          - Header search form
 *     Footer
 *          - Footer container
 *          - Footer logo & social links
 *          - Footer navigation
 *     Home page components
 *          - Links to Browser Articles, Live Support Chat, Submit a New Case
 *          - latest Articles and Most Popular Articles
 */


/* Adele Sans font 
   ========================================================================== */

@font-face {
    font-family: 'Adelle Sans';
    src: url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.eot');
    src: url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.eot?#iefix') format('embedded-opentype'),
         url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.woff2') format('woff2'),
         url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.woff') format('woff'),
         url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.ttf') format('truetype'),
         url('/customers/resource/AdelleSansFont/adellesanssage-thin-webfont.svg#adelle_sans_sagethin') format('svg');
    font-weight: 100;
    font-style: normal;

}
@font-face {
    font-family: 'Adelle Sans';
    src: url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.eot');
    src: url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.eot?#iefix') format('embedded-opentype'),
         url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.woff2') format('woff2'),
         url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.woff') format('woff'),
         url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.ttf') format('truetype'),
         url('/customers/resource/AdelleSansFont/adellesanssage-bold-webfont.svg#adelle_sans_sagebold') format('svg');
    font-weight: 700;
    font-style: normal;

}

/* Community Header
   ========================================================================== */
.sage-brand-color { color:#00DC00}
.header-stat{
    margin-left: -10px;
    margin-right: -10px;
}
.header-stat .header-top{
    background-color: #222222;
    border-color: #080808;
    height: 37px;
    padding: 0 12px;
}
.header-stat .header-top .navbar-brand {
    float: left;
    margin: 0;
    padding: 6px 0;
}
.header-stat .header-top .nav-holder {
    float: right;
}
.header-stat .header-top .nav-holder .navigation {
    float: right;
    list-style: none;
    margin: 0;
    padding: 0;
    font: bold 12px/15px Arial, Helvetica, sans-serif;
}
.header-stat .nav-holder .navigation li {
    float: left;
    margin: 0 0 0 11px;
    border-left: 1px solid #4A4A4A;
    padding: 7px 0 7px 11px;
}
.header-stat .nav-holder .navigation li a{
    color: #FFF;
    text-decoration: none;
}
.header-stat .header-mid-container,
.header-stat .header-top-container{
    max-width: 1140px;
    margin: 0 auto;
}
.header-stat .header-mid{
    padding: 29px 12px 11px;
}
.header-stat .header-mid h1{
    font-size: 24px;
    font-weight: normal;
    color: #848484;
    margin-left: 10px;
    vertical-align: top;
    line-height: 0.8;
}
.header-stat .logo-container a{
    text-decoration: none;
}

/* Header banner */

.header-splash{
    width: 100%;
}
.header-splash .splash{
    background: url(/customers/resource/SageHeaderImage) no-repeat;
    background-size: cover;
    height: 199px;
}
.header-splash .splash form .form-container{
    background: #FDFDFD;
    float: left;
    padding: 3px;
    border-radius: 2px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
}

/* Header search form */

.header-splash .splash form{
    padding: 6% 1.5% 0;
}
.splash .splash-container{
    width: 1140px;
    margin: 0 auto;
}
.splash form input#phSearchInput{
    display: inline-block;
    padding: 12px 12px 11px;
    font-size: 14px;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 2px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    width: 261px;
}
.splash form input[type="submit"]{
    background-image: none;
    background: url(/customers/resource/sageResources/icon-search.png) no-repeat;
    width: 41px;
    border: 0;
    height: 40px;
    display: inline-block;
    padding: 12px 12px;
    vertical-align: bottom;
    touch-action: manipulation;
    cursor: pointer;
}


/* Home Page visualforce components
   ========================================================================== */

.homepage-top{
    margin: 21px 12px;
}
.homepage-top h4{
    font-size: 26px;
    font-weight: bold;
    color: #3AB851;
}
.homepage-top p{
    font-size: 14px;
    color: #565656;
}
.homepage-bottom{
    margin-top: 27px;
}

/* Home page main container */
.homepage-bottom-main{
    width: 63%;
    float: left;
    margin-right: 30px;
}
/* Home page side container */
.homepage-bottom-side{
    width: 30%;
    float: left;
    border-left: 1px solid #ccc;
    padding-left: 18px;
}
.homepage-bottom-side h4{
    color: #3AB851;
    line-height: 22px;
    font-weight: bold;
    font-size: 14px;
}

/* Home page links */

.home-page-bottom-actions{
    float: left;
    width: 100%;
    min-height: 130px;
    border-bottom: 1px solid #C3C3C3;
    margin-bottom: 10px;
    padding-bottom: 11px;
}
.home-page-bottom-actions .action-btn{
    float: left;
    width: 128px;
    margin-right: 10%;
    text-align: center;
}
.home-page-bottom-actions .action-btn:last-of-type{
    margin-right: 0;
}
.home-page-bottom-actions span,
.home-page-bottom-actions a{
    font-size: 14px;
    line-height: 1.8;
    color: #3AB851;
}
.home-page-bottom-actions .action-btn img{
    width: 100px;
    height: 96px;
    margin: 0 auto;
}

/* Home page article list */
.home-page-bottom-articles{
    margin-top: 10px;
    margin-left: 12px; 
    float: left;
    clear: both;
}
.home-page-bottom-articles table > tbody > tr > td{
    width: 35%;
    vertical-align: top;
}
.home-page-bottom-articles table{
    width: auto;
}
.home-page-bottom-articles table th{
    font-size: 15px;
    font-weight: bold;
    color: #3AB851;
}
.home-page-bottom-articles .article-list tbody td{
    padding: 3px 6px 1px 3px;
    font-size: 13px;
    line-height: 21px;
}


/* Community Footer
   ========================================================================== */

.footer-holder{
    background-color: #FFF;
    clear: both;
    height: 450px;
    padding-top: 70px;
}
.footer-holder .container{
    max-width: 1300px;
    width: auto;
    background: none;
    margin: 0 auto;
}

/* Footer navigation */

.footer-holder .footer-link-group{
    float: left;
    height: auto;
    width: 25%;
    text-align: center;
}
.footer-holder .footer-link-group:last-of-type{
    margin-right: 0;
}

/* Footer logo */

.footer-holder .logo-container{
    margin: 0 auto;
    width: 120px;
}
.footer-holder .copy-box h5{
    font-family: 'Adelle Sans', sans-serif;
    font-weight: 700;
    font-size: 15px;
    font-weight: bold;
    color: #4d4f53;
}

/* Footer navigation items */

.footer-holder .copy-box {
    padding: 4px 0 0;
    color: #666;
    font-size: 0.857em;
    line-height: 1.25em;
}
.footer-holder .copy-box ul {
    list-style: none;
    margin: 0;
    padding: 0 0 12px;
}
.footer-holder .copy-box li {
    overflow: hidden;
    margin-left: 0;
    line-height: 17px;
}
.footer-holder .copy-box li a {
    font-family: 'Adelle Sans', sans-serif;
    font-weight: 100;
    color: #4d4f53;
    font-size: 15px;
}
.footer-holder .copy-box li a:hover, 
.footer-holder .copy-box li a:focus {
    color: #66ccff;
}
.footer-holder .copy-box a {
    text-decoration: none;
    outline: none;
    color: #4d4f53;
}

/* Footer social links */

.footer-holder .social-links{
    list-style: none;
    margin: 0;
    padding: 0;
    width: 250px;
    display: block;
    height: 40px;
    margin: 0 auto;
    padding: 30px 0;
}
.footer-holder .social-links li{
    float: left;
    margin: 0;
    margin-right: 10px;
}
.footer-holder .social-links li a{
    display: block;
    width: 38px;
    height: 38px;
    background: url(/customers/resource/SageLiveCommunityFooterIcons) no-repeat 0 -2px;
}
.footer-holder .copy-text p{
    font-family: 'Adelle Sans', sans-serif;
    font-weight: 100;
    font-size: 13px;
}
.footer-holder .copy-text{
    margin-bottom: 30px;
}
.footer-links{
    max-width: 1140px;
    clear: both;
    margin: 0 auto;
    position: relative;
    min-height: 106px;
}
.social-links li a.social-facebook{ background-position: -3px -2px; }
.social-links li a.social-twitter{ background-position: -46px -2px; }
.social-links li a.social-linkedin{ background-position: -89px -2px; }
.social-links li a.social-youtube{ background-position: -132px -2px; }
.social-links li a.social-instagram{ background-position: -175px -3px; }
.social-links li a.social-facebook:hover{ background-position: -3px -44px; }
.social-links li a.social-twitter:hover{ background-position: -46px -44px; }
.social-links li a.social-linkedin:hover{ background-position: -89px -44px; }
.social-links li a.social-youtube:hover{ background-position: -132px -44px; }
.social-links li a.social-instagram:hover{ background-position: -175px -45px; }

.center-text{
    text-align: center;
}


/* Salesforce overwrites
   ========================================================================== */

/* Hide "Logged in as.." in top bar*/
.networkMsgsWithCustomHeader .zen-pageMessages .zen-pageMsg{
    display: none;
}


/* Media queries
   ========================================================================== */

/* Change left and right padding for search form on smaller screens */

@media(min-width: 1150px){
    .header-splash .splash form{
        padding: 6% 5px 0;
    }
}