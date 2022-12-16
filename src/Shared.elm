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
import Storage exposing (Storage)
import View exposing (View)


type alias Flags =
    Json.Value


type alias Model =
    { storage : Storage
    }


type Msg
    = StorageUpdated Storage


init : Request -> Flags -> ( Model, Cmd Msg )
init _ flags =
    ( { storage = Storage.fromJson flags }
    , Cmd.none
    )


update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        StorageUpdated storage ->
            ( { model | storage = storage }
            , Cmd.none
            )


subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Storage.onChange StorageUpdated



-- VIEW


view :
    Model
    -> Request
    -> { page : View msg, toMsg : Msg -> msg }
    -> View msg
view model req { page, toMsg } =
    { title =
        if String.isEmpty page.title then
            "Phasmophobia"

        else
            page.title ++ " | Phasmophobia"
    , body =
        [ Components.Navbar.view model.storage.caseId (Route.fromUrl req.url)
        , Html.div [] (page.body |> List.map Html.fromUnstyled)
        ]
            |> List.map Html.toUnstyled
    }
