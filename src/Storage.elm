port module Storage exposing
    ( Storage
    , fromJson
    , onChange
    , saveCase
    )

import Json.Decode as Json
import Json.Encode as Encode


type alias Storage =
    { caseId : Int
    }


toJson : Storage -> Json.Value
toJson storage =
    Encode.object
        [ ( "caseId", Encode.int storage.caseId )
        ]


fromJson : Json.Value -> Storage
fromJson value =
    value
        |> Json.decodeValue decoder
        |> Result.withDefault initial


decoder : Json.Decoder Storage
decoder =
    Json.map Storage
        (Json.field "caseId" Json.int)


initial : Storage
initial =
    { caseId = 0
    }


saveCase : Int -> Storage -> Cmd msg
saveCase caseId storage =
    { storage | caseId = caseId }
        |> toJson
        |> save


onChange : (Storage -> msg) -> Sub msg
onChange fromStorage =
    load (\json -> fromJson json |> fromStorage)


port save : Json.Value -> Cmd msg


port load : (Json.Value -> msg) -> Sub msg
