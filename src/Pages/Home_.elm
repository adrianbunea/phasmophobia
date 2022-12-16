module Pages.Home_ exposing (Model, Msg, page)

import Gen.Params.Home_ exposing (Params)
import Html.Styled as Html exposing (Html)
import Html.Styled.Events as Events
import Page
import Random
import Request
import Shared
import Storage exposing (Storage)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init
        , update = update shared.storage
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = StartCase
    | CaseGenerated Int


update : Storage -> Msg -> Model -> ( Model, Cmd Msg )
update storage msg model =
    case msg of
        StartCase ->
            ( model
            , Random.generate CaseGenerated (Random.int 1 1000)
            )

        CaseGenerated id ->
            ( model
            , Storage.saveCase id storage
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Home"
    , body = bodyView |> List.map Html.toUnstyled
    }


bodyView : List (Html Msg)
bodyView =
    [ Html.button [ Events.onClick StartCase ] [ Html.text "Start Case" ]
    ]
