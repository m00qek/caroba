module Main exposing (main)

import Browser
import Html exposing (Html)
import Models exposing (..)
import Views exposing (view)


navigate step model =
    ( { model | page = Just step }, Cmd.none )


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        GoTo step ->
            navigate step model


subscriptions : Model -> Sub Message
subscriptions _ =
    Sub.none


init : flags -> ( Model, Cmd Message )
init _ =
    update (GoTo Authentication) { page = Nothing }


main : Program () Model Message
main =
    Browser.document
        { init = init
        , view = Views.view
        , update = update
        , subscriptions = subscriptions
        }
