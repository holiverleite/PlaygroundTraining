import UIKit

typealias EggChickenMemento = Dictionary<String, Any>
let EggCycleMementoKey = "eggLife"
let ChickenCycleMemenotKey = "chickenLife"
let ChickenEggLifeCycleMementoKey = "chickenLife"

class EggChickenState {
    var egg: String = ""
    var chicken: String = ""
    
    func seMemento() -> EggChickenMemento {
        return [EggCycleMementoKey: self.egg, ChickenCycleMemenotKey: self.chicken]
    }
    
    func restoreFromMemento(memento: EggChickenMemento) {
        guard let unwrappedEgg = memento[EggCycleMementoKey] as? String, let unwrappedChicken = memento[ChickenCycleMemenotKey] as? String else {
            return
        }

        self.egg = unwrappedEgg
        self.chicken = unwrappedChicken
    }
}

struct LifeCycle {
    static func saveState(memento: EggChickenMemento, keyName: String = ChickenEggLifeCycleMementoKey) {
        let defaults = UserDefaults.standard
        defaults.set(memento, forKey: keyName)
        defaults.synchronize()
        print("Saved")
    }
    
    static func restorePreviousState(with keyName: String = ChickenEggLifeCycleMementoKey) -> EggChickenMemento {
        let defaults = UserDefaults.standard
        guard let memento = defaults.object(forKey: keyName) as? EggChickenMemento else {
            print("Error unwrapping memento")
            return EggChickenMemento()
        }
        
        return memento
    }
}

var eggChickenState = EggChickenState()
eggChickenState.restoreFromMemento(memento: LifeCycle.restorePreviousState())

eggChickenState.egg = "1"
eggChickenState.chicken = "2"
LifeCycle.saveState(memento: eggChickenState.seMemento())

print("First state: \(eggChickenState.egg)")
print("First state: \(eggChickenState.chicken)")

eggChickenState.egg = "3"
eggChickenState.chicken = "4"
//LifeCycle.saveState(memento: eggChickenState.seMemento())
//print("Second state: \(eggChickenState.egg)")
//print("Second state: \(eggChickenState.chicken)")

eggChickenState.restoreFromMemento(memento: LifeCycle.restorePreviousState())
print("Second state: \(eggChickenState.egg)")
print("Second state: \(eggChickenState.chicken)")

