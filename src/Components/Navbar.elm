module Components.Navbar exposing (view)

import Css exposing (Style)
import Gen.Route as Route exposing (Route)
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes as Attributes



-- MODEL


navItems : Int -> List ( String, Route )
navItems caseId =
    [ ( "Home", Route.Home_ )
    , ( "Items", Route.Items )
    , ( "Overview", Route.Case__Id___Overview { id = String.fromInt caseId } )
    , ( "Photos", Route.Case__Id___Photos { id = String.fromInt caseId } )
    , ( "Evidence", Route.Evidence )
    , ( "Ghosts", Route.Ghosts )
    ]



-- VIEW


view : Int -> Route -> Html msg
view caseId currentRoute =
    Html.nav [ Attributes.css navbarStyles ]
        [ Html.ul [ Attributes.css navbarItemsStyles ] (caseId |> navItems |> List.map (navbarItem currentRoute)) ]


navbarItem : Route -> ( String, Route ) -> Html msg
navbarItem currentRoute ( label, route ) =
    let
        isActive =
            currentRoute == route
    in
    Html.li
        [ Attributes.css (navbarItemStyles isActive)
        ]
        [ Html.a
            [ Attributes.href (Route.toHref route)
            , Attributes.css navbarLinkStyles
            ]
            [ Html.text label
            ]
        ]



-- STYLES


navbarStyles : List Style
navbarStyles =
    [ Css.displayFlex
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.width (Css.pct 100)
    ]


navbarItemsStyles : List Style
navbarItemsStyles =
    [ Css.displayFlex
    , Css.alignItems Css.center
    , Css.property "justify-content" "space-evenly"
    , Css.width (Css.pct 100)
    , Css.listStyleType Css.none
    , Css.margin (Css.px 0)
    , Css.padding (Css.px 0)
    ]


navbarItemStyles : Bool -> List Style
navbarItemStyles isActive =
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


navbarLinkStyles : List Style
navbarLinkStyles =
    [ Css.textDecoration Css.none
    , Css.color Css.inherit
    ]
