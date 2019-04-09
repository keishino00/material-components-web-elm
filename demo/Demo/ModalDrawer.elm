module Demo.ModalDrawer exposing
    ( Model
    , Msg(..)
    , defaultModel
    , update
    , view
    )

import Demo.DrawerPage as DrawerPage exposing (DrawerPage)
import Demo.PermanentDrawer
import Html exposing (Html, text)
import Html.Attributes
import Html.Events
import Json.Decode as Decode
import Material.Drawer as Drawer exposing (drawerConfig, drawerScrim, modalDrawer)
import Material.Icon exposing (icon, iconConfig)
import Material.Theme as Theme
import Material.TopAppBar as TopAppBar exposing (topAppBar, topAppBarConfig)
import Material.Typography as Typography
import Platform.Cmd exposing (Cmd, none)


type alias Model =
    { drawerOpen : Bool
    , selectedIndex : Int
    }


defaultModel : Model
defaultModel =
    { drawerOpen = False
    , selectedIndex = 0
    }


type Msg
    = OpenDrawer
    | CloseDrawer
    | SetSelectedIndex Int


update : (Msg -> msg) -> Msg -> Model -> ( Model, Cmd msg )
update lift msg model =
    case msg of
        OpenDrawer ->
            ( { model | drawerOpen = True }, Cmd.none )

        CloseDrawer ->
            ( { model | drawerOpen = False }, Cmd.none )

        SetSelectedIndex index ->
            ( { model | selectedIndex = index }, Cmd.none )


view : Model -> DrawerPage Msg
view model =
    { title = "Modal Drawer"
    , drawer =
        modalDrawer
            { drawerConfig
                | open = model.drawerOpen
                , onClose = Just CloseDrawer
            }
            (DrawerPage.drawerBody SetSelectedIndex model.selectedIndex)
    , scrim = Just (drawerScrim [] [])
    , onMenuClick = Just OpenDrawer
    }
