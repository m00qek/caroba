module Views exposing (view)

import Browser exposing (Document)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Models exposing (..)


pageView model step =
    case step of
        Authentication ->
            [ h1 [] [ text "Caroba Connection Assistant" ]
            , label []
                [ text "Write the code that's on the screen of you Caroba Router"
                , input [] []
                ]
            , button [ onClick <| GoTo ChooseWanType ] [ text "Next" ]
            ]

        ChooseWanType ->
            [ h1 [] [ text "What the type of connection are you using to plug connect your route to internet?" ]
            , button [ onClick <| GoTo WanWiFi ] [ text "WiFi" ]
            , button [ onClick <| GoTo ChooseLanType ] [ text "Cable" ]
            ]

        WanWiFi ->
            [ h1 [] [ text "Select the network you want Caroba Router connects to" ]
            , label []
                [ text "WiFi network"
                , select [] []
                ]
            , label []
                [ text "Password"
                , input [ type_ "password" ] []
                ]
            , button [ onClick <| GoTo ChooseLanType ] [ text "next" ]
            ]

        ChooseLanType ->
            [ h1 [] [ text "How will you connect to the router?" ]
            , button [ onClick <| GoTo LanWiFi ] [ text "WiFi + Cable" ]
            , button [ onClick <| GoTo LanWiFi ] [ text "WiFi" ]
            , button [ onClick <| GoTo Congratulations ] [ text "Cable" ]
            ]

        LanWiFi ->
            [ h1 [] [ text "Create your WiFi network" ]
            , label []
                [ text "WiFi network"
                , input [] []
                ]
            , label []
                [ text "Password"
                , input [ type_ "password" ] []
                ]
            , button [ onClick <| GoTo Congratulations ] [ text "next" ]
            ]

        Congratulations ->
            [ h1 [] [ text "Congratulations!" ] ]


view : Model -> Document Message
view ({ page } as model) =
    { title = "Caroba Connection Assistant"
    , body =
        page
            |> Maybe.map (pageView model)
            |> Maybe.withDefault []
    }
