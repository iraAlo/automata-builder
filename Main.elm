import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Mouse
import Window

main : Signal Element
main =
  Signal.map2 scene Window.dimensions clickLocations

-- Store the locations of the mouse whenever there is a click
clickLocations : Signal (List (Int,Int))
clickLocations =
  Signal.foldp (::) [] (Signal.sampleOn Mouse.clicks Mouse.position)


-- Create a circle for all of the locations
scene : (Int,Int) -> List (Int,Int) -> Element
scene (w,h) locs =
  layers
    [collage w h (List.map (makeCircle (toFloat w) (toFloat h)) locs)]


-- Creates circle
makeCircle : Float -> Float -> (Int, Int) -> Form
makeCircle w h (x,y) =
  circle 25
    |> filled blue
    |> move (toFloat x - w/2, h/2 - toFloat y)


-- draggedLocations : Signal (List (Int, Int))
-- draggedLocations = 
--  Signal.foldp (::) [] (isDraggingExisting Touch.Touch)

-- isDraggingExisting : Touch.Touch -> List (Int, Int)

-- If an existing circle is dragged
-- dragCircle : (Int, Int) -> 
