extends Node2D

var points = 0
var plusPoints = 1
var potionCost = 10
var starCost = 400

func _ready():
	$Canvas/NumberOfPoints.text = str(points)
	$Canvas/PotionOneCost.text = "+5/click, Costs: " + str(potionCost)
	$Canvas/StarCost.text = "x5 multiplier for 30s\n Costs: 400"
	$Canvas/plusPointsAmt.text = str(plusPoints) + " per click"


func _on_RedButton_pressed():
	points = points + plusPoints
	$Canvas/NumberOfPoints.text = str(points)
	$Canvas/ButtonPressSound.play()


func _on_StarButton_pressed():
	if points >= starCost:
		points = points - starCost
		$Canvas/NumberOfPoints.text = str(points)
		plusPoints = plusPoints * 5
		$StarTimer.start()
		$Canvas/plusPointsAmt.text = str(plusPoints) + " per click"


func _on_PotionOne_pressed():
	if points >= potionCost:
		plusPoints = plusPoints + 5
		points = points - potionCost
		potionCost = potionCost * 2
		$Canvas/PotionOneCost.text = "+5/click, Costs: " + str(potionCost)
		$Canvas/NumberOfPoints.text = str(points)
		$Canvas/PotionSound.play()
		$Canvas/plusPointsAmt.text = str(plusPoints) + " per click"


func _on_PotionOne_hover():
	$Canvas/PotionOneCost.text = "Potion adds +5 \npoints per click"

func _on_StarTimer_timeout():
	plusPoints = plusPoints / 5
	$Canvas/plusPointsAmt.text = str(plusPoints) + " per click"
