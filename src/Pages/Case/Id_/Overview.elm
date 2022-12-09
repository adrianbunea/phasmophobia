module Pages.Case.Id_.Overview exposing (Model, Msg, page)

import Gen.Params.Case.Id_.Overview exposing (Params)
import Html
import Page
import Request
import Shared
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.element
        { init = init req.params.id
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    String


init : String -> ( Model, Cmd Msg )
init id =
    ( id, Cmd.none )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model =
    { title = "Overview"
    , body = [ [ "Case Overview", model ] |> String.join " " |> Html.text ]
    }
