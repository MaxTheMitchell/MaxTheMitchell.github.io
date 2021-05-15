module HomePage exposing (main)
import Html exposing (..)
import Html.Attributes exposing (..)
import Css exposing (display)

main : Html msg
main =
    Html.main_ []
    [
      headerBox "Max Mitchell's Portfolio"
      ,headerLinks
      ,aboutMe
      ,talks
      ,projects
    ]

  
headerLinks : Html msg
headerLinks =
  div [class "textbox center links"]
    [
      headerLink "https://github.com/MaxTheMitchell" "Github"
      ,headerLink "https://app.joinhandshake.com/users/11716834" "Handshake"
      ,headerLink "mailto:max7mitchell@gmail.com" "Email"
      ,headerLink "/resume.pdf" "Resume"
      ,headerLink "#projects" "Projects"
      ,headerLink "#talks" "Talks"
    ]

headerLink : String -> String -> Html msg
headerLink link label  =
  a [ href link ] [ h3 [] [text label ] ]

aboutMe : Html msg
aboutMe =
  div [ class "center" , style "display" "flex" ]
    [
      div [class "textbox" ]
        [
          h2[][text "About Me"]
          ,hr[][]
          ,p[]
            [
              text 
              """
              Max Mitchell is not to be overlooked. From a young age Max has always possessed an acute interest in mathematics and computers. 
              However, his interests extend beyond these as well and believes in an interdisciplinary approach.
              Through his education and own explorations he has come to learn a multiplicity of programming languages and the concepts that underpin them. 
              He is enrolled at Oregon State University Cascades and is 
              on his third year towards achieving a bachelors degree in computer science.
              """
            ]
        ]
      ,div[ style "width" "10%"][]
      ,img [
        imgSrc "rollerSkate.png"
        ,class "textbox"
        ,style "width" "40%"
        ][]
    ]

talks : Html msg 
talks = 
  div [id "talks", class "center", class "textbox"]
    [
      h2[][text "Tech Talks"]
      ,hr[][]
      ,p[]
        [
          text 
          """
          I have done a couple talks over zoom for my university's tech club that have been recorded that you can check out.
          They are each on a different programming language that I believe are being overlooked, Elm and Crystal.  
          """
        ]
      ,div[][
        a[href "https://media.oregonstate.edu/media/t/1_nzjrkuld"]
        [img[src "https://cfvod.kaltura.com/p/391241/sp/0/thumbnail/entry_id/1_nzjrkuld/version/100021/width/724/height/437"][]]
        ,a[href "https://media.oregonstate.edu/media/1_l284pk70"][
          img[src "https://cfvod.kaltura.com/p/391241/sp/0/thumbnail/entry_id/1_l284pk70/version/100011/width/724/height/437"][]
          ]
        ]
    ]

projects : Html msg
projects =
  div[][
    headerBox "Projects"
    ,div [ id "projects", class "center" ]
      [
        sightOfMusic
        ,gameOfLife3d
        ,tempest
        ,fractals
      ]
    ]

gameOfLife3d : Html msg 
gameOfLife3d = 
  div[class "project"]
    [
      (projectDescription
        "3D Game Of Life"
        [
          text "A 3D adaptation of "
          , a[href "https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life"][text "Conway's Game Of Life"]
          ,text  " written in Elm with WebGL."
        ]
        [
          ("/gameOfLife.html", "Play in Full Screen")
          ,(myGithubURL "3d-game-of-life", "3D Game of Life Repo")
        ]
      )
      ,  iframe[src "/gameOfLife.html", class "tempest-frame textbox"][] 
    ]

tempest : Html msg 
tempest =
  div[class "project"]
    [
      (projectDescription 
          "Tempest 2001" 
          [text 
          """
          This is my attempt to create a game inspired by tempest 2000 in the web browser. 
          It controls using the arrow keys to move and the space bar to shoot.
          """
          ]
          [
            ("/tempest.html", "Play in Full Screen")
            ,(myGithubURL "Tempest-Clone", "Tempest Repo")
          ])
      ,  iframe[src "/tempest.html", class "tempest-frame textbox"][] 
    ]

sightOfMusic : Html msg
sightOfMusic = 
  div[class "project"]
  [
    sightOfMusicDescription
    ,sightOfMusic16Imgs
    ,sightOfMusic64Imgs
  ]

fractals : Html msg
fractals =
  div[ class "project"]
    [
      fractalsDescription
      ,div [style "width" "50%", style "position" "relative"]
        [
          img[imgSrc "Mandelbrot1.gif", class "fractal-img" ][]
          ,img[imgSrc "Mandelbrot10.png", class "fractal-img"][]
          ,img[imgSrc "Mandelbrot16.png", class "fractal-img"][]
        ]
    ]

fractalsDescription : Html msg
fractalsDescription =
  projectDescription
    "Fractal Fun"
    [
      text 
        """
        One of my favorite things to program in my free time are visualizations of mathematical phenomena. 
        I love seeing how relatively simple mathematical principals can generate complex and beautiful results. 
        Here is a collection of such mathematical visualizations that I have done, mostly of fractals, but also of different mathematical visualizations such as cellular automata. 
        """
    ]
    [
      ((myGithubURL "Mandelbrot-Set"), "Mandelbrot Set Fractals Code")
    ]

sightOfMusicDescription : Html msg
sightOfMusicDescription =
  projectDescription 
    "The Sight if Music"
    [
      text 
        """
        The "Sight of Music" is a project I initially had the idea for while working at Sycamore-Semi where I was working on pulling data from web API's using a micro-controller to display 
        the status of different Fab equipment. Working on this birthed the idea in me that I could use Spotify's Web API to get the album cover of my currently playing song and 
        use that data to create some sort of display. The first thing I did was to create a 
        """
      ,a [ href ( myGithubURL "the-sight-of-music-server" ) ] [ text "website" ]
      ,text 
        """
        that would allow a user to authorize the website to read their Spotify data and to then parse 
        this data into a bitmap for a micro-controller to use. Next I started working on the display. The first thing I used to make the display was a 
        """
      ,a [ href "https://www.amazon.com/gp/product/B01CDTEJBG/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1" ] [ text "strip of 300 led lights" ]
      ,text "that I cut up and soldered into a 16x16 grid. I then created a "
      ,a [ href ( myGithubURL "sight-of-music-64x64-Grid-esp32" ) ] [ text "program" ]
      ,text " for an "
      ,a [ href "https://www.amazon.com/HiLetgo-Internet-Development-Wireless-Micropython/dp/B081CSJV2V/ref=sxts_sxwds-bia-wc-p13n1_0?cv_ct_cx=ESP8266&dchild=1&keywords=ESP8266&pd_rd_i=B081CSJV2V&pd_rd_r=b2bb2c5b-e9b8-4e75-ae58-e34d169199c8&pd_rd_w=NGANN&pd_rd_wg=FrshL&pf_rd_p=13bf9bc7-d68d-44c3-9d2e-647020f56802&pf_rd_r=XF3FABJ7YQ2CHENP1C30&psc=1&qid=1597975271&sr=1-1-791c2399-d602-4248-afbb-8a79de2d236f" ]
          [ text "esp8266" ]
      ,text 
        """
        that would issue get requests to the website I made and uses the bitmap that it received to make the display. This method worked pretty well for 
        simple album covers, but for album covers that were more complex a 16x16 grid wouldn't cut it. So then I ordered a 
        """
      ,a [ href "https://www.aliexpress.com/item/32381602322.html?spm=a2g0o.productlist.0.0.762174dbdchDnn&algo_pvid=d5900aa2-f4b9-441c-8558-c476d9b70dfb&algo_expid=d5900aa2-f4b9-441c-8558-c476d9b70dfb-0&btsid=0ab6d67915979748091914913e75c3&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_" ]
        [ text "64x64 led matrix" ]
      ,text " and upgraded to an "
      ,a [ href "https://www.amazon.com/gp/product/B07Q576VWZ/ref=ppx_yo_dt_b_asin_title_o01_s01?ie=UTF8&psc=1" ]
        [ text "esp32"]
      ,text " because the greater amount of LEDs warranted a better CPU. I was really happy with the results that the 64x64 matrix gave."          
    ]
    [
      ((myGithubURL "the-sight-of-music-server"), "Server Code")
      ,((myGithubURL "sight-of-music-ESP8266-client"), "ESP8266 16x16 Matrix Client Code")
      ,((myGithubURL "sight-of-music-64x64-Grid-esp32"), "ESP32 64x64 Matrix Client Code")
    ]
  
projectDescription : String -> List(Html msg) -> List((String, String)) -> Html msg
projectDescription title desc links =
  div [ class "textbox project-description" ]
    ([
      h2[] [ text title ]
      ,hr[][]
      ,p[] desc
      ,hr[][]
    ] ++ 
      List.map
        (\(link, display) -> a[ href link][ h3[][ text display] ]) 
        links
    )

sightOfMusic16Imgs : Html msg
sightOfMusic16Imgs =
  div[ class "sight-of-music-imgs" ]
    [
      div[class "textbox"][ h3[][ text "16x16 LED Strip Light Grid" ] ]
      ,flipBox (imgSrc "16x16front.jpg") (imgSrc "16x16back.jpg")
      ,flipBox (imgSrc "kkb.jpg") (src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.scdn.co%2Fimage%2F16ca7b8003014a97caecb5048aa1d0373d40f085&f=1&nofb=1")
      ,flipBox (imgSrc "monster.jpg") (src "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.knoxroad.com%2Fwp-content%2Fuploads%2F2011%2F02%2Frem-monster.jpg&f=1&nofb=1" )
      ,flipBox (imgSrc "courts.jpg") (src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthefirenote.com%2Fwp-content%2Fuploads%2F2018%2F05%2FParquetCourts_Wide_Awake_AlbumArt-1024x1024.jpg&f=1&nofb=1")
    ]
      
sightOfMusic64Imgs : Html msg
sightOfMusic64Imgs = 
  div[ class "sight-of-music-imgs" ]
    [
      div[class "textbox"][ h3[][ text "64x64 LED Matrix" ] ]
      ,flipBox (imgSrc "64x64Back.jpg") (imgSrc "64x64Front.jpg")
      ,flipBox (imgSrc "noDream.jpg") (src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.stereogum.com%2Fuploads%2F2020%2F05%2FJeff-Rosenstock-No-Dream-1589983860-640x640.jpg&f=1&nofb=1")
      ,flipBox (imgSrc "atom.jpg") (src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimagescdn.juno.co.uk%2Ffull%2FCS623861-01A-BIG.jpg&f=1&nofb=1")
      ,flipBox (imgSrc "drunk.jpg") (src "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.redd.it%2F3lnkntuvzkdz.jpg&f=1&nofb=1")
    ]

flipBox : Attribute msg -> Attribute msg -> Html msg
flipBox frontSrc backSrc =
  div[ class "flip-box" ]
    [
      div[ class "flip-box-inner" ]
        [
          div[ class "flip-box-front" ] [ img[ class "textbox album", frontSrc ][] ]
          ,div[ class "flip-box-back"] [ img[ class "textbox album", backSrc ][] ]
        ]
    ]

headerBox : String-> Html msg 
headerBox title =
    div [class "textbox center" ]
    [
      h1 [] [text title]
    ]

imgSrc : String -> Attribute msg
imgSrc name =
  src ("/imgs/" ++ name)

myGithubURL : String -> String 
myGithubURL project =
  "https://github.com/MaxTheMitchell/" ++ project
