module Models exposing (Message(..), Model, Step(..))


type Step
    = Authentication
    | ChooseWanType
    | WanWiFi
    | ChooseLanType
    | LanWiFi
    | Congratulations


type Message
    = GoTo Step


type alias Model =
    { page : Maybe Step }
