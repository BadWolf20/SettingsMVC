//
//  setting.swift
//  SettingsMVC
//
//  Created by Roman on 23.01.2022.
//

import Foundation
import UIKit

struct Setting {
    let name: String
    let style: Style
    let block: Block
    let imageMain: UIImage?

    static func getSectionsCount(list: [Setting]) -> Int {
        let set = Set(list.map{$0.block})
        return set.count
    }

    static func getSettingsList(list: [Setting], block: Block) -> [Setting] {
        var out = [Setting]()
        for i in list{
            if i.block == block {
                out.append(i)
            }
        }
        return out
    }

    static func getSettingsSectionLenght(list: [Setting], block: Block) -> Int {
        var out = Int()
        for i in list{
            if i.block == block {
                out += 1
            }
        }
        return out
    }

    enum Style {
        case check
        case move
    }

    enum Block {
        case fast
        case notifications
        case main

        static let allValues = [Block.fast, Block.notifications, Block.main]
    }
}


