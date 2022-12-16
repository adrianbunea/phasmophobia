module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Components.Navbar
import Gen.Route as Route
import Html.Styled as Html
import Json.Decode as Json
import Request exposing (Request)
import View exposing (View)


type alias Flags =
    Json.Value


type alias Model =
    {}


type Msg
    = NoOp


init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( {}, Cmd.none )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none



-- VIEW


view :
    Request
    -> { page : View msg, toMsg : Msg -> msg }
    -> View msg
view req { page, toMsg } =
    { title =
        if String.isEmpty page.title then
            "Phasmophobia"

        else
            page.title ++ " | Phasmophobia"
    , body =
        [ Components.Navbar.view { currentRoute = Route.fromUrl req.url }
        , Html.div [] (page.body |> List.map Html.fromUnstyled)
        ]
            |> List.map Html.toUnstyled
    }
