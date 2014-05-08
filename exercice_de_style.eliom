{shared{
  open Eliom_lib
  open Eliom_content
  open Eliom_content.Html5.F
}}

module Exercice_de_style_app =
  Eliom_registration.App (
    struct
      let application_name = "exercice_de_style"
    end)

(***********************)
(* Services (Web Pages) *)
(***********************)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

(***********************)
(* Skeletton Web Pages *)
(***********************)

let title_container = div [
    pre ~a:[a_class ["big-century"]] [
      a main_service
        [pcdata "V L A D A N A  J O N Q U E T"]
        ()
    ];
    div ~a:[a_class ["average-century"]] [
      pcdata "Art Conseil"
    ];
    div ~a:[a_class ["average-century"]] [
      pcdata "Galerie – Art et arts décoratifs du XXe siècle"
    ] 
]

let logo_container = div ~a:[a_class ["logo-container"]] [
    img ~alt:("LOGO")
      ~a:[a_width 50]
      ~src:(make_uri ~service:(Eliom_service.static_dir ()) ["img/LOGO_G.png"]) ()
  ]

let header_container_left = 
  div ~a:[a_class ["header-left-container"]] [
    logo_container;
    title_container
  ]
    
let header_container_right =
  div ~a:[a_class ["header-right-container"]] [
    nav [
      ul ~a:[a_class ["skel-menu"]] [
        li [a main_service
              [pcdata "Galerie"]
              ()];
        li [a main_service
              [pcdata "Décoration Intérieure"]
              ()];
        li [a main_service
              [pcdata "Art Conseil"]
              ()];
      ]
    ]
  ]

let footer =
  footer ~a:[a_class ["skel-footer"]] [
    div ~a:[a_class []] [
      div ~a:[a_class ["float-right"; "skel-footer-text"]] [
        pcdata "vladana.jonquet@outlook.com | 00 336 70 88 54 63"
      ]
    ]
  ]

let header_container = div ~a:[a_class ["header-container"]] [
    header_container_left;
    header_container_right;
  ]

let skeletton body_content =
  Lwt.return 
    (Eliom_tools.F.html
       ~title:"Vladana Jonquet"
       ~css:[["css";"exercice_de_style.css"]]
       (body [
           header [header_container];
           div ~a:[a_id "body-container"] [
             body_content
           ];
           footer
         ]))

(*************)
(* Home Page *)
(*************)

let home_page = 
  div ~a:[a_style "text-align: center; height: 100%"] [
    img ~alt:("home-image")
      ~a:[a_style "max-height: 100%; max-width: 100%"]
      ~src:(make_uri ~service:(Eliom_service.static_dir ()) ["img/home/B23K0049.JPG"]) ()
  ]

(**********)
(* Client *)
(**********)

{client{
   let resize_body () =
     ()
}}

(*************)

let () =
  Exercice_de_style_app.register
    ~service:main_service
    (fun () () -> skeletton home_page)

