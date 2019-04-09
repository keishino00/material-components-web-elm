module Demo.DenseTopAppBar exposing (Model, Msg(..), defaultModel, update, view)

import Demo.TopAppBarPage exposing (TopAppBarPage)
import Demo.Url as Url
import Dict exposing (Dict)
import Html exposing (Html, text)
import Html.Attributes
import Html.Events
import Material.Icon exposing (icon, iconConfig)
import Material.TopAppBar as TopAppBar exposing (prominentTopAppBar, shortCollapsedTopAppBar, shortTopAppBar, topAppBar, topAppBarConfig)
import Material.Typography as Typography


type alias Model =
    {}


type alias Example =
    {}


defaultExample : Example
defaultExample =
    {}


defaultModel : Model
defaultModel =
    {}


type Msg
    = NoOp


update : (Msg -> msg) -> Msg -> Model -> ( Model, Cmd msg )
update lift msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> TopAppBarPage Msg
view model =
    { fixedAdjust = TopAppBar.denseFixedAdjust
    , topAppBar =
        topAppBar { topAppBarConfig | dense = True }
            [ TopAppBar.row []
                [ TopAppBar.section
                    [ TopAppBar.alignStart
                    ]
                    [ icon
                        { iconConfig
                            | additionalAttributes = [ TopAppBar.navigationIcon ]
                        }
                        "menu"
                    , Html.span [ TopAppBar.title ] [ text "Dense" ]
                    ]
                , TopAppBar.section
                    [ TopAppBar.alignEnd
                    ]
                    [ icon
                        { iconConfig
                            | additionalAttributes =
                                [ TopAppBar.actionItem ]
                        }
                        "file_download"
                    , icon
                        { iconConfig
                            | additionalAttributes =
                                [ TopAppBar.actionItem ]
                        }
                        "print"
                    , icon
                        { iconConfig
                            | additionalAttributes =
                                [ TopAppBar.actionItem ]
                        }
                        "bookmark"
                    ]
                ]
            ]
    }
