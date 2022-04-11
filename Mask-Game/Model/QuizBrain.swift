//
//  QuizBrain.swift
//  Mask-Game
//
//  Created by Hachem Zarrad on 11/4/2022.
//

import Foundation

struct QuizBrain {
	let quiz = [
		Question(q: "Un masque chirurgical est constitué de combien de couches?", a: ["2", "3", "4"], correctAnswer: "3"),
		Question(q: "A quoi sert la barrette nasale interne de masque?", a: ["Améliore la qualité de l'ajustement au visage", "Pour ne pas avoir mal aux oreilles avec un masque", ""], correctAnswer: "Améliore la qualité de l'ajustement au visage"),
		Question(q: "Au niveau international, les masques chirurgicaux sont l'objet de la norme ISO 13485?", a: ["Vrai", "Faux", ""], correctAnswer: "Vrai"),
		Question(q: "Dans l'union européenne, Les masques sont des dispositifs médicaux soumis au règlement européen 2017/745", a: ["Vrai", "Faux", ""], correctAnswer: "Vrai"),
		Question(q: "Les trois couches de masques jetables sont fabriquées en:", a:["Coton","Polypropylène","Polyester"], correctAnswer: "Polypropylène"),
		Question(q: "Pour un masque chirurgical il faut que la filtration bactérienne (EFB) optimale supérieure à 95%.", a: ["Vrai", "Faux", ""], correctAnswer: "Vrai"),
		Question(q: "Identifier le cycle de recyclage de masque correcte:", a: ["Hygiénisation, contrôle, Tri et collecte, régénération de la matière, filage et tissage", "Tri et collecte, hygiénisation, contrôle, régénération de la matière, filage et tissage", "Contrôle,Tri et collecte, régénération de  la matière, Hygiénisation filage et tissage"], correctAnswer: "Tri et collecte, hygiénisation, contrôle, régénération de la matière, filage et tissage"),
		Question(q: "Un masque jeté dans la nature met:", a: ["100 ans à se dégrader", "200 ans à se dégrader", "400 ans à se dégrader"], correctAnswer: "400 ans à se dégrader"),
		Question(q: "Il faut jeter le masque chirurgical:", a: ["Après une heure d'utilisation continue", "Après une journée d'utilisation continue", "Après 3 à 4 heures d'utilisation continue"], correctAnswer: "Après 3 à 4 heures d'utilisation continue"),
		Question(q: "Qui est le premier producteur des masques jetables?", a: ["La chine", "Vietnam", "USA"], correctAnswer: "Vietnam"),
		Question(q: "Le polypropylène est un dérivé du:", a: ["Phosphate", "Pétrole", "Fer"], correctAnswer: "Pétrole"),
		Question(q: "Il faut jeter les masques usagés:", a: ["Dans un sac plastique dédié, résistant et disposant d’un système de fermeture fonctionnel et le placer dans la poubelle des ordures ménagères", "Directement dans la poubelle des ordures ménagères", "Dans un simple sac de poubelle"], correctAnswer: "Dans un sac plastique dédié, résistant et disposant d’un système de fermeture fonctionnel et le placer dans la poubelle des ordures ménagères"),
		Question(q: "Les premiers éléments semblables à des masques de protection respiratoire remontent à:", a: ["La civilisation égyptienne", "Civilisation grecque", "Empire Romain"], correctAnswer: "Empire Romain"),
		Question(q: "Qui a proposé le masque de protection sous forme d’un tissu inhibé d’eau à placer devant la bouche des navigateurs pour se protéger des attaques chimiques?", a: ["Léonard de Vinci", "Christopher Columbus", ""], correctAnswer: "Léonard de Vinci"),
		Question(q: "Que deviennent les masques recyclés:", a: ["Des nouveaux masques", "Des granulés de polypropylène", ""], correctAnswer: "Des granulés de polypropylène"),
		Question(q: "Le masque à usage unique a fait son apparition en:", a: ["1950", "1960", "1970"], correctAnswer: "1970"),
		Question(q: "Les premiers masques étaient utilisés sans fondement scientifique", a: ["Vrai", "Faux", ""], correctAnswer: "Vrai"),
		Question(q: "Le symbole universel des matériaux recyclables est:", a: ["Illustration de vecteur de symbole  d'icône de logo de fleur d'arbre de   feuille", "Pictogrammes constitués d'un carré orange avec une illustration noire à l'intérieur", "Cercle de Möbius"], correctAnswer: "Cercle de Möbius"),
		Question(q: "Le cercle de Möbius aussi appelé boucle, anneau ou ruban est créé en:", a: ["1940", "1970", ""], correctAnswer: "1970"),
		Question(q: "Qui collecte les déchets en France?", a: ["Les préfectures", "Les mairies", ""], correctAnswer: "Les mairies"),
		Question(q: "En France les masques usagés représentent:", a: ["100 tonnes de déchets par jour", "200 tonnes de déchets par jour", "400 tonnes de déchets par jour"], correctAnswer: "400 tonnes de déchets par jour"),
		Question(q: "La société française opère dans l'industrie :", a: ["Aérospatiale", "Promotion immobilière", "Recyclage et développement durable "], correctAnswer: "Recyclage et développement durable ")
	]
	
	var questionNumber = 0
	var score = 0
	
	mutating func checkAnswer(_ userAnswer: String) -> Bool  {
		if userAnswer == quiz[questionNumber].correctAnswer {
			score += 1
			return true
		}
		return false
	}
	
	func getQuestionText() -> String {
		return quiz[questionNumber].text
	}
	
	func getProgress() -> Float {
		return Float(questionNumber + 1) / Float(quiz.count)
	}
	
	mutating func nextQuestion() {
		if questionNumber + 1 < quiz.count {
			questionNumber += 1
		}
		else {
			questionNumber = 0
			score = 0
		}
		
	}
	
	func getScore() -> Int {
		return score
	}
	
	func getFirstSuggestion() -> String {
		return quiz[questionNumber].answer[0]
	}
	
	func getSecondSuggestion() -> String {
		return quiz[questionNumber].answer[1]
	}
	
	func getThirdSuggestion() -> String {
		return quiz[questionNumber].answer[2]
	}
	
}
