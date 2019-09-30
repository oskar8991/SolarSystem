//
//  GameScene.swift
//  SolarSystem
//
//  Created by iD Student on 7/6/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import SpriteKit
import GameplayKit

struct GameState {
    static let PlanetView : UInt32 = 0
    static let PlanetViewInformation : UInt32 = 1
    static let PlanetPictureView : UInt32 = 2
    
}

class GameScene: SKScene {
    
    var rightSide = SKSpriteNode()
    var leftSide = SKSpriteNode()
    var currentPlanet : SKSpriteNode?
    var currentImageView : UIImageView?
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let textView = UITextView()
    var cam : SKCameraNode?
    var stars1 : [SKShapeNode] = []
    var stars2 : [SKShapeNode] = []
    var touchBeganLoc = CGPoint(x: 0,y: 0)
    var beginingCameraLoc = CGPoint(x: 0,y: 0)
    var state = GameState.PlanetView
    let sunAtlas = SKTextureAtlas(named: "Sprites-Sun")
    let mercuryAtlas = SKTextureAtlas(named: "Sprites-Mercury")
    let venusAtlas = SKTextureAtlas(named: "Sprites-Venus")
    let earthAtlas = SKTextureAtlas(named: "Sprites-Earth")
    let marsAtlas = SKTextureAtlas(named: "Sprites-Mars")
    let jupiterAtlas = SKTextureAtlas(named: "Sprites-Jupiter")
    let saturnAtlas = SKTextureAtlas(named: "Sprites-Saturn")
    let uranusAtlas = SKTextureAtlas(named: "Sprites-Uranus")
    let neptuneAtlas = SKTextureAtlas(named: "Sprites-Neptune")

    var planetSun : SKSpriteNode?
    var planetMercury : SKSpriteNode?
    var planetVenus : SKSpriteNode?
    var planetEarth : SKSpriteNode?
    var planetMars : SKSpriteNode?
    var planetJupiter : SKSpriteNode?
    var planetSaturn : SKSpriteNode?
    var planetUranus : SKSpriteNode?
    var planetNeptune : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        planetSun = SKSpriteNode()
        planetMercury = SKSpriteNode()
        planetVenus = SKSpriteNode()
        planetEarth = SKSpriteNode()
        planetMars = SKSpriteNode()
        planetJupiter = SKSpriteNode()
        planetSaturn = SKSpriteNode()
        planetUranus = SKSpriteNode()
        planetNeptune = SKSpriteNode()
        
        textView.frame = CGRect(x: 360, y: 35, width: 280, height: 200)
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor(white: 1, alpha: 0.1)
        textView.font = UIFont(name: "AmericanTypewriter", size: 11)
        textView.isEditable = false
        textView.alpha = 0.0
        
        
        imageView1.frame = CGRect(x: 360, y: 250, width: 90, height: 65)
        imageView1.alpha = 0.0
        imageView1.isUserInteractionEnabled = true
        
        imageView2.frame = CGRect(x: 460, y: 250, width: 70, height: 60)
        imageView2.alpha = 0.0
        imageView2.isUserInteractionEnabled = true

        imageView3.frame = CGRect(x: 545, y: 250, width: 95, height: 70)
        imageView3.alpha = 0.0
        imageView3.isUserInteractionEnabled = true

        
        cam = SKCameraNode()
        self.camera = cam
        addChild(cam!)

        for _ in 0...70{
            stars1.append(spawnStar1())
            
        }
        
        let sunTexture = sunAtlas.textureNamed("frame_0_delay-0.08s")
        planetSun = SKSpriteNode(texture : sunTexture)
        let mercuryTexture = mercuryAtlas.textureNamed("frame_0_delay-0.03s")
        planetMercury = SKSpriteNode(texture: mercuryTexture)
        let venusTexture = venusAtlas.textureNamed("venus1")
        planetVenus = SKSpriteNode(texture: venusTexture)
        let earthTexture = earthAtlas.textureNamed("earth1")
        planetEarth = SKSpriteNode(texture: earthTexture)
        let marsTexture = marsAtlas.textureNamed("frame_0_delay-0.06s")
        planetMars = SKSpriteNode(texture: marsTexture)
        let jupiterTexture = jupiterAtlas.textureNamed("frame_0_delay-0.1s")
        planetJupiter = SKSpriteNode(texture: jupiterTexture)
        let saturnTexture = saturnAtlas.textureNamed("frame_0_delay-0.07s")
        planetSaturn = SKSpriteNode(texture: saturnTexture)
        let uranusTexture = uranusAtlas.textureNamed("uranus1")
        planetUranus = SKSpriteNode(texture: uranusTexture)
        let neptuneTexture = neptuneAtlas.textureNamed("frame_0_delay-0.05s")
        planetNeptune = SKSpriteNode(texture: neptuneTexture)
        
        
        let sunFrames = ["frame_0_delay-0.08s","frame_1_delay-0.08s","frame_2_delay-0.08s","frame_3_delay-0.08s","frame_4_delay-0.08s","frame_5_delay-0.08s","frame_6_delay-0.08s","frame_7_delay-0.08s","frame_8_delay-0.08s","frame_9_delay-0.08s","frame_10_delay-0.08s","frame_11_delay-0.08s","frame_12_delay-0.08s","frame_13_delay-0.08s","frame_14_delay-0.08s","frame_15_delay-0.08s","frame_16_delay-0.08s","frame_17_delay-0.08s","frame_18_delay-0.08s","frame_19_delay-0.08s","frame_20_delay-0.08s","frame_21_delay-0.08s","frame_22_delay-0.08s","frame_23_delay-0.08s","frame_24_delay-0.08s","frame_25_delay-0.08s","frame_26_delay-0.08s",].map {sunAtlas.textureNamed($0) }
        let sunAnimate = SKAction.animate(with: sunFrames, timePerFrame: 0.08)
        planetSun?.run(SKAction.repeatForever(sunAnimate))
        
        let mercuryFrames = ["frame_0_delay-0.03s","frame_1_delay-0.03s","frame_2_delay-0.03s","frame_3_delay-0.03s","frame_4_delay-0.03s","frame_5_delay-0.03s","frame_6_delay-0.03s","frame_7_delay-0.03s","frame_8_delay-0.03s","frame_9_delay-0.03s","frame_10_delay-0.03s","frame_11_delay-0.03s","frame_12_delay-0.03s","frame_13_delay-0.03s","frame_14_delay-0.03s","frame_15_delay-0.03s","frame_16_delay-0.03s","frame_17_delay-0.03s","frame_18_delay-0.03s","frame_19_delay-0.03s","frame_20_delay-0.03s","frame_21_delay-0.03s","frame_22_delay-0.03s","frame_23_delay-0.03s","frame_24_delay-0.03s","frame_25_delay-0.03s","frame_26_delay-0.03s","frame_27_delay-0.03s","frame_28_delay-0.03s","frame_29_delay-0.03s","frame_30_delay-0.03s","frame_31_delay-0.03s","frame_32_delay-0.03s","frame_33_delay-0.03s","frame_34_delay-0.03s","frame_35_delay-0.03s","frame_36_delay-0.03s","frame_37_delay-0.03s","frame_38_delay-0.03s","frame_39_delay-0.03s","frame_40_delay-0.03s","frame_41_delay-0.03s","frame_42_delay-0.03s","frame_43_delay-0.03s","frame_44_delay-0.03s","frame_45_delay-0.03s","frame_46_delay-0.03s","frame_47_delay-0.03s","frame_48_delay-0.03s","frame_49_delay-0.03s","frame_50_delay-0.03s","frame_51_delay-0.03s","frame_52_delay-0.03s","frame_53_delay-0.03s","frame_54_delay-0.03s","frame_55_delay-0.03s","frame_56_delay-0.03s","frame_57_delay-0.03s","frame_58_delay-0.03s","frame_59_delay-0.03s","frame_60_delay-0.03s","frame_61_delay-0.03s","frame_62_delay-0.03s","frame_63_delay-0.03s","frame_64_delay-0.03s","frame_65_delay-0.03s","frame_66_delay-0.03s","frame_67_delay-0.03s","frame_68_delay-0.03s","frame_69_delay-0.03s","frame_70_delay-0.03s","frame_71_delay-0.03s","frame_72_delay-0.03s","frame_73_delay-0.03s","frame_74_delay-0.03s","frame_75_delay-0.03s","frame_76_delay-0.03s","frame_77_delay-0.03s","frame_78_delay-0.03s","frame_79_delay-0.03s","frame_80_delay-0.03s","frame_81_delay-0.03s","frame_82_delay-0.03s","frame_83_delay-0.03s","frame_84_delay-0.03s","frame_85_delay-0.03s","frame_86_delay-0.03s","frame_87_delay-0.03s","frame_88_delay-0.03s","frame_89_delay-0.03s","frame_90_delay-0.03s",].map {mercuryAtlas.textureNamed($0) }
        let mercuryAnimate = SKAction.animate(with: mercuryFrames, timePerFrame: 0.07)
        planetMercury?.run(SKAction.repeatForever(mercuryAnimate))
        
        let venusFrames = ["venus1","venus2","venus3","venus4","venus5","venus6","venus7","venus8","venus9","venus10","venus11","venus12","venus13","venus14","venus15","venus16","venus17","venus18","venus19","venus20","venus21","venus22","venus23","venus24","venus25","venus26","venus27","venus28","venus29","venus30","venus31","venus32","venus33","venus34","venus35","venus36","venus37","venus38","venus39","venus40","venus41","venus42","venus43","venus44","venus45","venus46","venus47","venus48","venus49","venus50","venus51","venus52","venus53","venus54","venus55","venus56","venus57","venus58","venus59","venus60","venus61","venus62","venus63","venus64","venus65","venus66","venus67","venus68","venus69","venus70","venus71","venus72","venus73","venus74","venus75","venus76","venus77","venus78","venus79","venus80","venus81","venus82","venus83","venus84","venus85","venus86","venus87","venus88","venus89","venus90",].map {venusAtlas.textureNamed($0) }
        let venusAnimate = SKAction.animate(with: venusFrames, timePerFrame: 0.08)
        planetVenus?.run(SKAction.repeatForever(venusAnimate))
        
        let earthFrames = ["earth1","earth2","earth3","earth4","earth5","earth6","earth7","earth8","earth9","earth10","earth11","earth12","earth13","earth14","earth15","earth16","earth17","earth18","earth19","earth20","earth21","earth22","earth23","earth24","earth25","earth26","earth27","earth28","earth29","earth30","earth31","earth32","earth33","earth34","earth35","earth36","earth37","earth38","earth39","earth40","earth41",].map {earthAtlas.textureNamed($0) }
        let earthAnimate = SKAction.animate(with: earthFrames, timePerFrame: 0.08)
        planetEarth?.run(SKAction.repeatForever(earthAnimate))
        
        let marsFrames = ["frame_0_delay-0.06s","frame_1_delay-0.06s","frame_2_delay-0.06s","frame_3_delay-0.06s","frame_4_delay-0.06s","frame_5_delay-0.06s","frame_6_delay-0.06s","frame_7_delay-0.06s","frame_8_delay-0.06s","frame_9_delay-0.06s","frame_10_delay-0.06s","frame_11_delay-0.06s","frame_12_delay-0.06s","frame_13_delay-0.06s","frame_14_delay-0.06s","frame_15_delay-0.06s","frame_16_delay-0.06s","frame_17_delay-0.06s","frame_18_delay-0.06s","frame_19_delay-0.06s","frame_20_delay-0.06s","frame_21_delay-0.06s","frame_22_delay-0.06s","frame_23_delay-0.06s","frame_24_delay-0.06s","frame_25_delay-0.06s","frame_26_delay-0.06s","frame_27_delay-0.06s","frame_28_delay-0.06s","frame_29_delay-0.06s","frame_30_delay-0.06s","frame_31_delay-0.06s","frame_32_delay-0.06s","frame_33_delay-0.06s","frame_34_delay-0.06s","frame_35_delay-0.06s","frame_36_delay-0.06s","frame_37_delay-0.06s","frame_38_delay-0.06s","frame_39_delay-0.06s","frame_40_delay-0.06s","frame_41_delay-0.06s","frame_42_delay-0.06s","frame_43_delay-0.06s","frame_44_delay-0.06s","frame_45_delay-0.06s","frame_46_delay-0.06s","frame_47_delay-0.06s","frame_48_delay-0.06s","frame_49_delay-0.06s","frame_50_delay-0.06s","frame_51_delay-0.06s","frame_52_delay-0.06s","frame_53_delay-0.06s","frame_54_delay-0.06s","frame_55_delay-0.06s","frame_56_delay-0.06s","frame_57_delay-0.06s","frame_58_delay-0.06s","frame_59_delay-0.06s","frame_60_delay-0.06s","frame_61_delay-0.06s","frame_62_delay-0.06s","frame_63_delay-0.06s","frame_64_delay-0.06s","frame_65_delay-0.06s","frame_66_delay-0.06s","frame_67_delay-0.06s","frame_68_delay-0.06s","frame_69_delay-0.06s","frame_70_delay-0.06s","frame_71_delay-0.06s","frame_72_delay-0.06s","frame_73_delay-0.06s","frame_74_delay-0.06s","frame_75_delay-0.06s","frame_76_delay-0.06s","frame_77_delay-0.06s","frame_78_delay-0.06s","frame_79_delay-0.06s","frame_80_delay-0.06s","frame_81_delay-0.06s","frame_82_delay-0.06s","frame_83_delay-0.06s","frame_84_delay-0.06s","frame_85_delay-0.06s","frame_86_delay-0.06s","frame_87_delay-0.06s","frame_88_delay-0.06s","frame_89_delay-0.06s","frame_90_delay-0.06s","frame_91_delay-0.06s","frame_92_delay-0.06s","frame_93_delay-0.06s","frame_94_delay-0.06s","frame_95_delay-0.06s","frame_96_delay-0.06s","frame_97_delay-0.06s","frame_98_delay-0.06s","frame_99_delay-0.06s","frame_100_delay-0.06s","frame_101_delay-0.06s","frame_102_delay-0.06s","frame_103_delay-0.06s","frame_104_delay-0.06s","frame_105_delay-0.06s","frame_106_delay-0.06s","frame_107_delay-0.06s","frame_108_delay-0.06s","frame_109_delay-0.06s","frame_110_delay-0.06s","frame_111_delay-0.06s","frame_112_delay-0.06s","frame_113_delay-0.06s","frame_114_delay-0.06s","frame_115_delay-0.06s","frame_116_delay-0.06s","frame_117_delay-0.06s","frame_118_delay-0.06s","frame_119_delay-0.06s","frame_120_delay-0.06s","frame_121_delay-0.06s","frame_122_delay-0.06s","frame_123_delay-0.06s",].map {marsAtlas.textureNamed($0) }
        let marsAnimate = SKAction.animate(with: marsFrames, timePerFrame: 0.08)
        planetMars?.run(SKAction.repeatForever(marsAnimate))
        
        let jupiterFrames = ["frame_0_delay-0.1s","frame_1_delay-0.1s","frame_2_delay-0.1s","frame_3_delay-0.1s","frame_4_delay-0.1s","frame_5_delay-0.1s","frame_6_delay-0.1s","frame_7_delay-0.1s","frame_8_delay-0.1s","frame_9_delay-0.1s","frame_10_delay-0.1s","frame_11_delay-0.1s","frame_12_delay-0.1s","frame_13_delay-0.1s","frame_14_delay-0.1s","frame_15_delay-0.1s","frame_16_delay-0.1s","frame_17_delay-0.1s","frame_18_delay-0.1s","frame_19_delay-0.1s","frame_20_delay-0.1s","frame_21_delay-0.1s","frame_22_delay-0.1s","frame_23_delay-0.1s","frame_24_delay-0.1s","frame_25_delay-0.1s","frame_26_delay-0.1s","frame_27_delay-0.1s","frame_28_delay-0.1s","frame_29_delay-0.1s","frame_30_delay-0.1s","frame_31_delay-0.1s","frame_32_delay-0.1s","frame_33_delay-0.1s","frame_34_delay-0.1s","frame_35_delay-0.1s","frame_36_delay-0.1s","frame_37_delay-0.1s","frame_38_delay-0.1s","frame_39_delay-0.1s","frame_40_delay-0.1s","frame_41_delay-0.1s","frame_42_delay-0.1s","frame_43_delay-0.1s","frame_44_delay-0.1s","frame_45_delay-0.1s","frame_46_delay-0.1s","frame_47_delay-0.1s","frame_48_delay-0.1s","frame_49_delay-0.1s","frame_50_delay-0.1s","frame_51_delay-0.1s","frame_52_delay-0.1s","frame_53_delay-0.1s","frame_54_delay-0.1s","frame_55_delay-0.1s","frame_56_delay-0.1s","frame_57_delay-0.1s","frame_58_delay-0.1s","frame_59_delay-0.1s","frame_60_delay-0.1s","frame_61_delay-0.1s","frame_62_delay-0.1s","frame_63_delay-0.1s","frame_64_delay-0.1s","frame_65_delay-0.1s","frame_66_delay-0.1s","frame_67_delay-0.1s","frame_68_delay-0.1s","frame_69_delay-0.1s","frame_70_delay-0.1s","frame_71_delay-0.1s",].map {jupiterAtlas.textureNamed($0) }
        let jupiterAnimate = SKAction.animate(with: jupiterFrames, timePerFrame: 0.08)
        planetJupiter?.run(SKAction.repeatForever(jupiterAnimate))
        
        let saturnFrames = ["frame_0_delay-0.07s","frame_1_delay-0.07s","frame_2_delay-0.07s","frame_3_delay-0.07s","frame_4_delay-0.07s","frame_5_delay-0.07s","frame_6_delay-0.07s","frame_7_delay-0.07s","frame_8_delay-0.07s","frame_9_delay-0.07s","frame_10_delay-0.07s","frame_11_delay-0.07s","frame_12_delay-0.07s","frame_13_delay-0.07s","frame_14_delay-0.07s","frame_15_delay-0.07s","frame_16_delay-0.07s","frame_17_delay-0.07s","frame_18_delay-0.07s","frame_19_delay-0.07s","frame_20_delay-0.07s","frame_21_delay-0.07s","frame_22_delay-0.07s","frame_23_delay-0.07s","frame_24_delay-0.07s","frame_25_delay-0.07s","frame_26_delay-0.07s","frame_27_delay-0.07s","frame_28_delay-0.07s","frame_29_delay-0.07s","frame_30_delay-0.07s",].map {saturnAtlas.textureNamed($0) }
        let saturnAnimate = SKAction.animate(with: saturnFrames, timePerFrame: 0.08)
        planetSaturn?.run(SKAction.repeatForever(saturnAnimate))
        
        let uranusFrames = ["uranus1","uranus2","uranus3","uranus4","uranus5","uranus6",].map {uranusAtlas.textureNamed($0) }
        let uranusAnimate = SKAction.animate(with: uranusFrames, timePerFrame: 0.08)
        planetUranus?.run(SKAction.repeatForever(uranusAnimate))
        
        let neptuneFrames = ["frame_0_delay-0.05s","frame_1_delay-0.05s","frame_2_delay-0.05s","frame_3_delay-0.05s","frame_4_delay-0.05s","frame_5_delay-0.05s","frame_6_delay-0.05s","frame_7_delay-0.05s","frame_8_delay-0.05s","frame_9_delay-0.05s","frame_10_delay-0.05s","frame_11_delay-0.05s","frame_12_delay-0.05s","frame_13_delay-0.05s","frame_14_delay-0.05s","frame_15_delay-0.05s","frame_16_delay-0.05s","frame_17_delay-0.05s","frame_18_delay-0.05s","frame_19_delay-0.05s","frame_20_delay-0.05s","frame_21_delay-0.05s","frame_22_delay-0.05s","frame_23_delay-0.05s","frame_24_delay-0.05s","frame_25_delay-0.05s","frame_26_delay-0.05s","frame_27_delay-0.05s","frame_28_delay-0.05s","frame_29_delay-0.05s","frame_30_delay-0.05s","frame_31_delay-0.05s","frame_32_delay-0.05s","frame_33_delay-0.05s","frame_34_delay-0.05s","frame_35_delay-0.05s","frame_36_delay-0.05s","frame_37_delay-0.05s","frame_38_delay-0.05s","frame_39_delay-0.05s","frame_40_delay-0.05s","frame_41_delay-0.05s","frame_42_delay-0.05s","frame_43_delay-0.05s","frame_44_delay-0.05s","frame_45_delay-0.05s","frame_46_delay-0.05s","frame_47_delay-0.05s","frame_48_delay-0.05s","frame_49_delay-0.05s","frame_50_delay-0.05s","frame_51_delay-0.05s","frame_52_delay-0.05s","frame_53_delay-0.05s","frame_54_delay-0.05s","frame_55_delay-0.05s","frame_56_delay-0.05s","frame_57_delay-0.05s","frame_58_delay-0.05s","frame_59_delay-0.05s","frame_60_delay-0.05s","frame_61_delay-0.05s","frame_62_delay-0.05s","frame_63_delay-0.05s","frame_64_delay-0.05s","frame_65_delay-0.05s","frame_66_delay-0.05s","frame_67_delay-0.05s","frame_68_delay-0.05s","frame_69_delay-0.05s","frame_70_delay-0.05s","frame_71_delay-0.05s","frame_72_delay-0.05s","frame_73_delay-0.05s","frame_74_delay-0.05s","frame_75_delay-0.05s","frame_76_delay-0.05s","frame_77_delay-0.05s","frame_78_delay-0.05s","frame_79_delay-0.05s","frame_80_delay-0.05s","frame_81_delay-0.05s","frame_82_delay-0.05s","frame_83_delay-0.05s","frame_84_delay-0.05s","frame_85_delay-0.05s","frame_86_delay-0.05s","frame_87_delay-0.05s","frame_88_delay-0.05s","frame_89_delay-0.05s","frame_90_delay-0.05s","frame_91_delay-0.05s","frame_92_delay-0.05s","frame_93_delay-0.05s","frame_94_delay-0.05s","frame_95_delay-0.05s","frame_96_delay-0.05s",].map {neptuneAtlas.textureNamed($0) }
        let neptuneAnimate = SKAction.animate(with: neptuneFrames, timePerFrame: 0.08)
        planetNeptune?.run(SKAction.repeatForever(neptuneAnimate))
        
        
        risePlanetSun()
        risePlanetMercury()
        risePlanetVenus()
        risePlanetEarth()
        risePlanetMars()
        risePlanetJupiter()
        risePlanetSaturn()
        risePlanetUranus()
        risePlanetNeptune()
        
        
    }
    
    
    func spawnStar1() -> SKShapeNode{
        let radius1 = CGFloat(arc4random_uniform(3)) + 1
        let star1 = SKShapeNode(circleOfRadius: radius1)
        let randomX1 = CGFloat(arc4random_uniform(UInt32(1.25 * size.width))) - (0.625 * size.width)
        let randomY1 = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height/2
        star1.fillColor = UIColor.white
        star1.strokeColor = UIColor.white
        star1.position = CGPoint(x: randomX1, y: randomY1)
        star1.glowWidth = 2
        
        addChild(star1)
        
        let randomDuration1 = TimeInterval(arc4random_uniform(4) + 4)
        let starAction1 = SKAction.repeatForever(SKAction.move(by: CGVector(dx: -150, dy: 0), duration: randomDuration1))
        
        star1.run(starAction1)
        return star1
    }
    
    func spawnStar2() -> SKShapeNode{
            let radius2 = CGFloat(arc4random_uniform(1)) + 0.5
            let star2 = SKShapeNode(circleOfRadius: radius2)
            let randomX2 = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width/2
            let randomY2 = CGFloat(arc4random_uniform(UInt32((planetEarth?.size.height)!))) - (planetEarth?.size.height)!/2
            star2.fillColor = UIColor.white
            star2.strokeColor = UIColor.white
            star2.position = CGPoint(x: randomX2, y: randomY2)
            star2.glowWidth = 1
            star2.alpha = 0.0
        
            addChild(star2)
        
        let randomDuration2 = TimeInterval(arc4random_uniform(4) + 4)
        let starAction2 = SKAction.group([
            SKAction.fadeIn(withDuration: 6.0),
            SKAction.repeatForever(SKAction.move(by: CGVector(dx: -100, dy: 0), duration: randomDuration2))
            ])
        
        star2.run(starAction2)
        return star2
        
    }



    func risePlanetSun(){
            planetSun?.color = UIColor.red
            planetSun?.size = CGSize(width: 280, height: 280)
            planetSun?.position = CGPoint(x: ((-size.width/2) + 180), y: ((-size.height)/2))
            planetSun?.zPosition = 10
     
            addChild(planetSun!)
    
        let movePlanetSun = SKAction.sequence([
        SKAction.move(to: CGPoint(x: (-size.width/2) + 180, y: 0), duration: 1.4),
        ])
    
        movePlanetSun.timingMode = .easeIn
        
        planetSun?.run(movePlanetSun)
        
    }
    
    func risePlanetMercury(){
        planetMercury?.color = UIColor.orange
        planetMercury?.size = CGSize(width: 35, height: 35)
        planetMercury?.position = CGPoint(x: ((-size.width/2) + 380), y: ((-size.height)/2))
        planetMercury?.zPosition = 10
        
        addChild(planetMercury!)
        
        let movePlanetMercury = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 380, y: 0), duration: 1.5),
            ])
        
        movePlanetMercury.timingMode = .easeIn
        
        planetMercury?.run(movePlanetMercury)
        
    }
    
    func risePlanetVenus(){
        planetVenus?.color = UIColor.brown
        planetVenus?.size = CGSize(width: 40, height: 40)
        planetVenus?.position = CGPoint(x: ((-size.width/2) + 470), y: ((-size.height)/2))
        planetVenus?.zPosition = 10
        
        addChild(planetVenus!)
        
        let movePlanetVenus = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 470, y: 0), duration: 1.6),
            ])
        
        movePlanetVenus.timingMode = .easeIn

        planetVenus?.run(movePlanetVenus)
        
    }
    
    func risePlanetEarth(){
        planetEarth?.color = UIColor.green
        planetEarth?.size = CGSize(width: 70, height: 70)
        planetEarth?.position = CGPoint(x: ((-size.width/2) + 580), y: ((-size.height)/2))
        planetEarth?.zPosition = 10
        
        addChild(planetEarth!)
        
        let movePlanetEarth = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 580, y: 0), duration: 1.7),
            ])
        
        movePlanetEarth.timingMode = .easeIn

        planetEarth?.run(movePlanetEarth)
        
    }
    
    func risePlanetMars(){
        planetMars?.color = UIColor.brown
        planetMars?.size = CGSize(width: 35, height: 35)
        planetMars?.position = CGPoint(x: ((-size.width/2) + 685), y: ((-size.height)/2))
        planetMars?.zPosition = 10
        
        addChild(planetMars!)
        
        let movePlanetMars = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 685, y: 0), duration: 1.8),
            ])
        
        movePlanetMars.timingMode = .easeIn
        
        planetMars?.run(movePlanetMars)
        
    }
    
    func risePlanetJupiter(){
        planetJupiter?.color = UIColor.lightGray
        planetJupiter?.size = CGSize(width: 160, height: 160)
        planetJupiter?.position = CGPoint(x: ((-size.width/2) + 830), y: ((-size.height)/2))
        planetJupiter?.zPosition = 10
        
        addChild(planetJupiter!)
        
        let movePlanetJupiter = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 830, y: 0), duration: 1.9),
            ])
        
        movePlanetJupiter.timingMode = .easeIn

        planetJupiter?.run(movePlanetJupiter)
        
    }
    
    func risePlanetSaturn(){
        planetSaturn?.color = UIColor.brown
        planetSaturn?.size = CGSize(width: 200, height: 90)
        planetSaturn?.position = CGPoint(x: ((-size.width/2) + 1010), y: ((-size.height)/2))
        planetSaturn?.zPosition = 10
        
        addChild(planetSaturn!)
        
        let movePlanetSaturn = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 1030, y: 0), duration: 2),
            ])
        
        movePlanetSaturn.timingMode = .easeIn
        
        planetSaturn?.run(movePlanetSaturn)
        
    }
    
    func risePlanetUranus(){
        planetUranus?.color = UIColor.blue
        planetUranus?.size = CGSize(width: 50, height: 50)
        planetUranus?.position = CGPoint(x: ((-size.width/2) + 1160), y: ((-size.height)/2))
        planetUranus?.zPosition = 10
        
        addChild(planetUranus!)
        
        let movePlanetUranus = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 1165, y: 0), duration: 2.1),
            ])
        
        movePlanetUranus.timingMode = .easeIn

        planetUranus?.run(movePlanetUranus)
        
    }
    
    func risePlanetNeptune(){
        planetNeptune?.color = UIColor.blue
        planetNeptune?.size = CGSize(width: 60, height: 60)
        planetNeptune?.position = CGPoint(x: ((-size.width/2) + 1250), y: ((-size.height)/2))
        planetNeptune?.zPosition = 10
        
        addChild(planetNeptune!)
        
        let movePlanetNeptune = SKAction.sequence([
            SKAction.move(to: CGPoint(x: (-size.width/2) + 1250, y: 0), duration: 2.2),
            ])
        
        movePlanetNeptune.timingMode = .easeIn

        planetNeptune?.run(movePlanetNeptune)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
 
    }
    
    func touchMoved(toPoint pos : CGPoint) {
 
    }
    
    func hidePlanets(excludedPlanetHash : Int){
        if planetSun?.hash != excludedPlanetHash{
            planetSun?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetMercury?.hash != excludedPlanetHash{
            planetMercury?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetVenus?.hash != excludedPlanetHash{
            planetVenus?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetEarth?.hash != excludedPlanetHash{
            planetEarth?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetMars?.hash != excludedPlanetHash{
            planetMars?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetJupiter?.hash != excludedPlanetHash{
            planetJupiter?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetSaturn?.hash != excludedPlanetHash{
            planetSaturn?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetUranus?.hash != excludedPlanetHash{
            planetUranus?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        if planetNeptune?.hash != excludedPlanetHash{
            planetNeptune?.run(SKAction.fadeOut(withDuration: 0.7))
        }
        
    }
    
    func restorePlanetView(){
        self.camera?.run(SKAction.move(to: CGPoint(x: 0, y: 0), duration: 1.0))
        self.camera?.run(SKAction.scale(to: 1, duration: 1.0))
        
    }
    
    func revivePlanets(){
        planetSun?.run(SKAction.fadeIn(withDuration: 0.7))
        planetMercury?.run(SKAction.fadeIn(withDuration: 0.7))
        planetVenus?.run(SKAction.fadeIn(withDuration: 0.7))
        planetEarth?.run(SKAction.fadeIn(withDuration: 0.7))
        planetMars?.run(SKAction.fadeIn(withDuration: 0.7))
        planetJupiter?.run(SKAction.fadeIn(withDuration: 0.7))
        planetSaturn?.run(SKAction.fadeIn(withDuration: 0.7))
        planetUranus?.run(SKAction.fadeIn(withDuration: 0.7))
        planetNeptune?.run(SKAction.fadeIn(withDuration: 0.7))
    }
    
    func removeStar2(){
        for star2 in stars2{
            star2.removeFromParent()
        }
        
    }
    
    func removeTextView(){
        UIView.animate(withDuration: 1.0, animations: {self.textView.alpha = 0.0
        }, completion: { _ in
            self.textView.removeFromSuperview()
        })
        
    }
    
    func removeImageViews(){
        UIView.animate(withDuration: 1.0, animations: {self.imageView1.alpha = 0.0 }, completion: { _ in self.imageView1.removeFromSuperview()
        })
        UIView.animate(withDuration: 1.0, animations: {self.imageView2.alpha = 0.0 }, completion: { _ in self.imageView2.removeFromSuperview()
        })
        UIView.animate(withDuration: 1.0, animations: {self.imageView3.alpha = 0.0 }, completion: { _ in self.imageView3.removeFromSuperview()
        })
        
        
    }
    
    func restorePlanetInformationViewImageView1() {
        UIView.animate(withDuration: 0.7, animations: {
        self.imageView1.frame = CGRect(x: 360, y: 250, width: 90, height: 65)
            self.textView.alpha = 1.0
            self.imageView2.alpha = 1.0
            self.imageView3.alpha = 1.0
            self.currentPlanet?.run(SKAction.fadeIn(withDuration: 0.7))
            
        })
        
    }
    
    func restorePlanetInformationViewImageView2() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView2.frame = CGRect(x: 460, y: 250, width: 70, height: 60)
            self.textView.alpha = 1.0
            self.imageView1.alpha = 1.0
            self.imageView3.alpha = 1.0
            self.currentPlanet?.run(SKAction.fadeIn(withDuration: 0.7))
            
        })
        
    }
    
    func restorePlanetInformationViewImageView3() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView3.frame = CGRect(x: 545, y: 250, width: 95, height: 70)
            self.textView.alpha = 1.0
            self.imageView1.alpha = 1.0
            self.imageView2.alpha = 1.0
            self.currentPlanet?.run(SKAction.fadeIn(withDuration: 0.7))
            
        })
        
    }
    
    func moveFromPlanetImage1ToPlanetImage2() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView1.frame = CGRect(x: ((self.size.width/4) - 1000), y: ((self.size.height/4) - 195), width: 540, height: 390)
            self.imageView2.frame = CGRect(x: ((self.size.width/4) - 200), y: ((self.size.height/4) - 180), width: 400, height: 360)
            self.imageView2.alpha = 1.0
            
        })
        currentImageView = imageView2
    }
    
    func moveFromPlanetImage2ToPlanetImage1() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView1.frame = CGRect(x: ((self.size.width/4) - 270), y: ((self.size.height/4) - 195), width: 540, height: 390)
            self.imageView2.frame = CGRect(x: ((self.size.width/4) + 1000), y: ((self.size.height/4) - 180), width: 400, height: 360)
            self.imageView1.alpha = 1.0
            
        })
        currentImageView = imageView1

    }
    
    func moveFromPlanetImage2ToPlanetImage3() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView2.frame = CGRect(x: ((self.size.width/4) - 1000), y: ((self.size.height/4) - 195), width: 540, height: 390)
            self.imageView3.frame = CGRect(x: ((self.size.width/4) - 237.5), y: ((self.size.height/4) - 175), width: 475, height: 350)
            self.imageView3.alpha = 1.0
            
        })
        currentImageView = imageView3

    }
    
    func moveFromPlanetImage3ToPlanetImage2() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageView2.frame = CGRect(x: ((self.size.width/4) - 200), y: ((self.size.height/4) - 180), width: 400, height: 360)
            self.imageView3.frame = CGRect(x: ((self.size.width/4) + 1000), y: ((self.size.height/4) - 195), width: 400, height: 360)
            self.imageView2.alpha = 1.0
            
        })
        currentImageView = imageView2
        
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        touchBeganLoc = (touches.first?.location(in: self))!
        beginingCameraLoc = (self.camera?.position)!
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        rightSide = SKSpriteNode(color: UIColor.white, size: CGSize(width: 200, height: 1000))
        rightSide.position = CGPoint(x: size.width/2 - 100, y: 0)
        rightSide.alpha = 0.0
        leftSide = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 200, height: 1000))
        leftSide.position = CGPoint(x: -size.width/2 + 100, y: 0)
        leftSide.alpha = 0.0
        
        if state == GameState.PlanetViewInformation {
            if (touch.view?.isEqual(imageView1))!{
                state = GameState.PlanetPictureView
                currentImageView = imageView1
                UIView.animate(withDuration: 0.7, animations: {
                    self.imageView1.frame = CGRect(x: ((self.size.width/4) - 270), y: ((self.size.height/4) - 195), width: 540, height: 390)
                    self.imageView2.frame = CGRect(x: ((self.size.width/4) + 270), y: ((self.size.height/4) - 195), width: 400, height: 360)
                    self.imageView3.frame = CGRect(x: ((self.size.width/4) + 810), y: ((self.size.height/4) - 195), width: 475, height: 350)
                    self.textView.alpha = 0.0
                    self.imageView2.alpha = 0.0
                    self.imageView3.alpha = 0.0
                    self.currentPlanet?.run(SKAction.fadeOut(withDuration: 0.7))
                    self.camera?.addChild(self.rightSide)
                    self.camera?.addChild(self.leftSide)

                })
                
            }
            else if (touch.view?.isEqual(imageView2))!{
                state = GameState.PlanetPictureView
                currentImageView = imageView2
                UIView.animate(withDuration: 0.7, animations: {
                    self.imageView1.frame = CGRect(x: ((self.size.width/4) - 600), y: ((self.size.height/4) - 180), width: 540, height: 390)
                    self.imageView2.frame = CGRect(x: ((self.size.width/4) - 200), y: ((self.size.height/4) - 180), width: 400, height: 360)
                    self.imageView3.frame = CGRect(x: ((self.size.width/4) + 200), y: ((self.size.height/4) - 180), width: 475, height: 350)
                    self.textView.alpha = 0.0
                    self.imageView1.alpha = 0.0
                    self.imageView3.alpha = 0.0
                    self.currentPlanet?.run(SKAction.fadeOut(withDuration: 0.7))
                    self.camera?.addChild(self.rightSide)
                    self.camera?.addChild(self.leftSide)
                    
                })

            }
            else if (touch.view?.isEqual(imageView3))!{
                state = GameState.PlanetPictureView
                currentImageView = imageView3
                UIView.animate(withDuration: 0.7, animations: {
                    self.imageView1.frame = CGRect(x: ((self.size.width/4) - 1187.5), y: ((self.size.height/4) - 175), width: 540, height: 390)
                    self.imageView2.frame = CGRect(x: ((self.size.width/4) - 712.5), y: ((self.size.height/4) - 175), width: 400, height: 360)
                    self.imageView3.frame = CGRect(x: ((self.size.width/4) - 237.5), y: ((self.size.height/4) - 175), width: 475, height: 350)
                    self.textView.alpha = 0.0
                    self.imageView1.alpha = 0.0
                    self.imageView2.alpha = 0.0
                    self.currentPlanet?.run(SKAction.fadeOut(withDuration: 0.7))
                    self.camera?.addChild(self.rightSide)
                    self.camera?.addChild(self.leftSide)
                    
                })

            } else {
                restorePlanetView()
                revivePlanets()
                removeStar2()
                removeTextView()
                removeImageViews()
                state = GameState.PlanetView
            }
            
        }
            
        else if state == GameState.PlanetPictureView {
        
            if rightSide.contains(touch.location(in: self.camera!)) {
                if (currentImageView?.isEqual(imageView1))! {
                    moveFromPlanetImage1ToPlanetImage2()
                } else if (currentImageView?.isEqual(imageView2))! {
                    self.moveFromPlanetImage2ToPlanetImage3()
                }
            }
            
            else if leftSide.contains(touch.location(in: self.camera!)) {
                if (currentImageView?.isEqual(imageView2))! {
                    moveFromPlanetImage2ToPlanetImage1()
                } else if (currentImageView?.isEqual(imageView3))! {
                    self.moveFromPlanetImage3ToPlanetImage2()
                }
            }
                
            else {
                state = GameState.PlanetViewInformation
                restorePlanetInformationViewImageView1()
                restorePlanetInformationViewImageView2()
                restorePlanetInformationViewImageView3()
                

            }
            
        }
        
        else if state == GameState.PlanetView {
            
            if (planetSun?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetSun
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetSun?.position.x)! + 130), y: (planetSun?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.45, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetSun?.hash)!)
                    for _ in 0...5{
                        stars2.append(spawnStar2())}
            
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "sunImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "sunImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "sunImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    self.view?.addSubview(textView)
                    textView.text = "The sun is one of the 100 billion+ stars in the Milky Way Galaxy and orbits 25,000 light years from the galactic core. It lies at the heart of the solar system and holds approximately 99.8% of the whole system's mass and travels at approximately 220kms-1 with it taking close to 250 million years for it to complete one orbit.\n\nName: Sun\nAge: 4.6 Billion Years\nType: Yellow Dwarf (G2V)\nDiameter: 1,392,684 km\nEquatorial Circumference: 4,370,005.6 km\nMass: 1.99*10^30 kg\nSurface Temperature: 5,500°C or 9,932°F"
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })

                }
            }
            
            if (planetMercury?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetMercury
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetMercury?.position.x)! + 20), y: (planetMercury?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.07, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetMercury?.hash)!)
                    for _ in 0...30{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "mercuryImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "mercuryImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "mercuryImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    textView.text = "Mercury has the closest proximity to the sun out of all the other planets in the solar system. The crater heavy surface is as a consequence of Mercury not having a proper atmosphere to absorb meteor impacts. \n\nName: Mercury\nAge: 4.503 Billion Years\nType: Planet\nDiameter: 4877.9 km\nEquatorial Circumference: 15,392 km\nMass: 3.29*10^23 kg\nSurface Temperature [D]: 450°C or 840°F\nSurface Temperature [N]: -170°C or -280°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetVenus?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetVenus
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetVenus?.position.x)! + 20), y: (planetVenus?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.07, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetVenus?.hash)!)
                    for _ in 0...30{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "venusImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "venusImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "venusImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })

                    textView.text = "Venus is the second planet from the sun and has a temperature even higher than Mercury and has a toxic atmosphere with a pressure of 90 atmospheres. Venus was named after the Roman goddess of love and beauty and spins in the opposite direction of most planets.\n\nName: Venus\nAge: 4.503 Billion Years\nType: Planet\nDiameter: 12,102 km\nEquatorial Circumference: 38,026 km\nMass: 4.9*10^24 kg\nSurface Temperature: 462°C or 864°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetEarth?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetEarth
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetEarth?.position.x)! + 40), y: (planetEarth?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.12, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetEarth?.hash)!)
                    for _ in 0...30{
                        stars2.append(spawnStar2())}

                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "earthImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "earthImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "earthImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })

                    textView.text = "Being the third planet from the Sun, the Earth is a waterworld with two thirds of the planet covered by ocean. Its atmosphere is rich in life sustaining nitrogen and oxygen hence it being the only known planet at the time to sustain life with it rotating at approximately 467ms-1 about its axis.\n\nName: Earth\nAge: 4.543 Billion Years\nType: Planet [Waterworld]\nDiameter: 12,741 km\nEquatorial Circumference: 40,074 km\nMass: 5.97*10^24 kg\nSurface Temperature: 15°C or 59°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetMars?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetMars
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetMars?.position.x)! + 20), y: (planetMars?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.06, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetMars?.hash)!)
                    for _ in 0...60{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "marsImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "marsImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "marsImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                
                    textView.text = "Mars is the fourth planet from the Sun and has a rocky surface and valleys with storm systems raning from tornade-like dust devils to planet-engulfig dust storms. Mars is able to harbor water ice and the reddish cast is due to an iron oxide spread out on the surface.\n\nName: Mars\nAge: 4.503 Billion Years\nType: Planet\nDiameter: 6,779 km\nEquatorial Circumference: 21,334 km\nMass: 6.39*10^23 kg\nSurface Temperature [S]: 20°C or 70°F\nSurface Temperature [W]: -125°C or -195°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetJupiter?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetJupiter
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetJupiter?.position.x)! + 80), y: (planetJupiter?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.25, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetJupiter?.hash)!)
                    for _ in 0...20{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "jupiterImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "jupiterImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "jupiterImageTransparent3")
                  UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    textView.text = "The fifth planet from the Sun, Jupiter is the most massive planet in our solar system and it's mostly a gaseous world with the majority of the gases being hydrogen and helium. It has a strong magnetic field with dozens of moons and the swirling clouds on the surface are colorful due to different types of trace gases.\n\nName: Jupiter\nAge: 4.503 Billion Years\nType: Planet [Gas Giant]\nDiameter: 139,822 km\nEquatorial Circumference: 439,264 km\nMass: 1.90*10^27 kg\nSurface Temperature: -145°C or -234°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }

            if (planetSaturn?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetSaturn
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetSaturn?.position.x)! + 60), y: (planetSaturn?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.25, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetSaturn?.hash)!)
                    for _ in 0...20{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "saturnImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "saturnImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "saturnImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    textView.text = "Saturn is the sixth planet from the Sun and is primarly known for its rings. At first, Galileo believed that Jupiter was composed of three unique parts but more than 40 years later Huygens proposed them as being rings made out of ice and rock. Saturn is a gaseous planet mostly composed of hydrogen and helium.\n\nName: Saturn\nAge: 4.503 Billion Years\nType: Planet [Gas Giant]\nDiameter: 116,464 km\nEquatorial Circumference: 378,675 km\nMass: 5.68*10^26 kg\nSurface Temperature: -178°C or -288°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetUranus?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetUranus
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetUranus?.position.x)! + 27), y: (planetUranus?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.09, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetUranus?.hash)!)
                    for _ in 0...40{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "uranusImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "uranusImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "uranusImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    textView.text = "The sevent planet from the Sun, Uranus is the only giant planet whose equator is nearly at right angles to its orbit meaning that it essentially orbits on its side possibly due to an earlier collision. The blue-green tint is as a result of the methane present in the atmosphere. \n\nName: Uranus\nAge: 4.503 Billion Years\nType: Planet [Gas Giant]\nDiameter: 50,724 km\nEquatorial Circumference: 160,590 km\nMass: 8.68*10^25 kg\nSurface Temperature: -216°C or -357°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
            
            if (planetNeptune?.contains(touchLocation))!{
                if state == GameState.PlanetView {
                    currentPlanet = planetNeptune
                    state = GameState.PlanetViewInformation
                    let centerAction = SKAction.move(to: CGPoint(x: ((planetNeptune?.position.x)! + 26), y: (planetNeptune?.position.y)!), duration: 1.0)
                    let zoomAction = SKAction.scale(to: 0.09, duration: 1.0)
                    self.camera?.run(zoomAction)
                    self.camera?.run(centerAction)
                    hidePlanets(excludedPlanetHash: (planetNeptune?.hash)!)
                    for _ in 0...40{
                        stars2.append(spawnStar2())}
                    
                    self.view?.addSubview(imageView1)
                    imageView1.image = UIImage(named: "neptuneImageTransparent1")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView1.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView2)
                    imageView2.image = UIImage(named: "neptuneImageTransparent2")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView2.alpha = 1.0
                    })
                    
                    self.view?.addSubview(imageView3)
                    imageView3.image = UIImage(named: "neptuneImageTransparent3")
                    UIView.animate(withDuration: 1.0, animations: {
                        self.imageView3.alpha = 1.0
                    })
                    
                    textView.text = "Neptune is the eight planet from the Sun and has winds that are at times faster than the speed of sound. It was the first planet to be predicted to exist purely with the use of mathematics due to irregularities in the orbit of Uranus as found by French astronomer Alexis Bouvard.\n\nName: Neptune\nAge: 4.503 Billion Years\nType: Planet [Gas Giant]\nDiameter: 49,244 km\nEquatorial Circumference: 155,600 km\nMass: 1.02*10^26 kg\nSurface Temperature: -214°C or -353°F"
                    self.view?.addSubview(textView)
                    UIView.animate(withDuration: 1.0, animations: {
                        self.textView.alpha = 1.0
                    })
                }
            }
        }

      }



    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchedMovedLoc = (touches.first?.location(in: self))!
        let touchXDiff = touchedMovedLoc.x - touchBeganLoc.x
        
     if (self.camera?.position.x)! - (touchXDiff/2) >= -size.width/8 && (self.camera?.position.x)! - (touchXDiff/2) <= size.width/8 {
     self.camera?.position.x -= (touchXDiff/2)
     }
     
     touchBeganLoc = touchedMovedLoc

    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        for star1 in stars1 {
            /*if star1.position.x + star1.frame.size.width/2 <= (-1.125 * size.width) {
                star1.position.x = (1.125 * size.width) + star1.frame.size.width/2
            }*/
          if star1.position.x <= -0.625 * size.width{
               star1.position.x = 0.625 * size.width
               
          }
        }
    }
}






