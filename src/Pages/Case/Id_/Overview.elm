module Pages.Case.Id_.Overview exposing (Model, Msg, page)

import Css exposing (Style)
import Gen.Params.Case.Id_.Overview exposing (Params)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes
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
    , body = bodyView |> List.map Html.toUnstyled
    }


bodyView : List (Html Msg)
bodyView =
    [ navView ]


navView : Html Msg
navView =
    Html.nav [ Attributes.css navStyles ]
        [ Html.ul [ Attributes.css navItemsStyles ] (navItems |> List.map navItemView) ]


navItemView : ( String, Bool ) -> Html Msg
navItemView ( name, isActive ) =
    Html.li
        [ Attributes.css (navItemStyles isActive)
        ]
        [ Html.a
            [ Attributes.href "#"
            , Attributes.css navLinkStyles
            ]
            [ Html.text name
            ]
        ]



-- STYLES


navStyles : List Style
navStyles =
    [ Css.displayFlex
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.width (Css.pct 100)
    ]


navItemsStyles : List Style
navItemsStyles =
    [ Css.displayFlex
    , Css.alignItems Css.center
    , Css.property "justify-content" "space-evenly"
    , Css.width (Css.pct 100)
    , Css.listStyleType Css.none
    , Css.margin (Css.px 0)
    , Css.padding (Css.px 0)
    ]


navItemStyles : Bool -> List Style
navItemStyles isActive =
    [ Css.width (Css.pct 100)
    , Css.textAlign Css.center
    , Css.padding (Css.px 8)
    , Css.border3 (Css.px 1) Css.solid (Css.hex "BEBEBE")
    , Css.borderTopLeftRadius <| Css.px 4
    , Css.borderTopRightRadius <| Css.px 4
    ]
        ++ (if isActive then
                activeItemStyles

            else
                []
           )


activeItemStyles : List Style
activeItemStyles =
    [ Css.borderBottomColor Css.transparent
    ]


navLinkStyles : List Style
navLinkStyles =
    [ Css.textDecoration Css.none
    , Css.color Css.inherit
    ]



-- OTHER


navItems : List ( String, Bool )
navItems =
    [ ( "Home", False )
    , ( "Items", False )
    , ( "Overview", True )
    , ( "Photos", False )
    , ( "Evidence", False )
    , ( "Ghosts", False )
    ]
