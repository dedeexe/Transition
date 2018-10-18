//
//  CyberArt.swift
//  CyberPunkGuide
//
//  Created by dede.exe on 17/10/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation

struct CyberArt {
    var title : String?
    var description : String?
    var image : String?
}


func createArts() -> [CyberArt] {
    
    return [
        
          CyberArt(title: "Matrix",
                   description: "Lançado em março de 1999, Matrix custou US$ 65 milhões e rendeu mais de US$ 456 milhões. Matrix Reloaded, lançado em maio de 2003, custou US$ 127 milhões, mas já faturou mais US$ 740 milhões e entrou para a lista dos filmes mais vistos da história. A continuação foi também o primeiro filme a arrecadar mais de 100 milhões em um único final de semana. Só no Brasil, mais de 5 milhões de pessoas foram ao cinema prestigiar a segunda parte da trilogia.",
                   image: "matrix"),
          
          CyberArt(title: "Looper",
                   description: "No ano de 2044, um assassino de 25 anos chamado Joseph \"Joe\" Simmons trabalha como \"Looper\" para uma companhia da máfia de Kansas City. Um looper mata pessoas enviadas do futuro, através de uma máquina do tempo, do quartel-general da companhia em Xangai no ano de 2074 e livra-se dos corpos. Loopers são pagos (em barras de prata que chegam amarradas às costas da vítima), sob a condição que suas vítimas nunca devem escapar. Quando Joe descobre que seu novo alvo é o seu eu do futuro, ele falha em sua missão e o deixa escapar. Seus empregadores começam a caçá-lo por não ter cumprido seu trabalho, forçando Joe a lutar por sua vida enquanto caça seu eu do futuro.",
                   image: "looper"),
          
          CyberArt(title: "Ghost In The Shell",
                   description: "Ghost in the Shell é um mangá de influências cyberpunk, criado por Masamune Shirow. Rendeu uma continuação, intitulada Ghost in the Shell 2: Man/Machine Interface, que foi lançada em 2002. \n\nInicialmente, o mangá foi adaptado nos filmes de animação Ghost in the Shell, em 1995, e Ghost in the Shell 2: Innocence, em 2004 – o primeiro, com uma versão totalmente remasterizada, em 2008, chamado de Ghost in the Shell: 2.0.",
                   image: "ghostintheshell"),
          
          CyberArt(title: "Akira",
                   description: "A história desenrola-se em Neo-Tóquio, uma cidade de Tóquio reconstruída (sobre o que é hoje a Baía de Tóquio) depois de ter sido destruída na III Guerra Mundial. Segundo vem depois a constar, a III Guerra Mundial foi (supostamente) iniciada pelo crescimento incontrolável de poderes sobrenaturais de uma criança chamada Akira, que foi registrado num programa governamental secreto de pesquisa. No tempo real do enredo, 30 anos depois da III Guerra Mundial, uma gang de motoqueiros liderados por Kaneda é envolvido numa luta com a gangue rival, quando o membro mais novo do gang de Kaneda, Tetsuo, colide numa auto-estrada com uma criança misteriosa que havia escapado do programa de investigação psíquica secreta do governo.",
                   image: "akira")
    ]
    
}
