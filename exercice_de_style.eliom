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

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let logo_container = div [
    
  ]

let header_container_left = div [
    div []
  ]

let header_container_right = div [
    div []
  ]

let header_container = div [
    header_container_left;
    header_container_right;
  ]

let () =
  Exercice_de_style_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"Vladana Jonquet"
           ~css:[["css";"exercice_de_style.css"]]
           (body [
               header [header_container];
             ])))
