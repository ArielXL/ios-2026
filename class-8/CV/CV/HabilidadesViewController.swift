//
//  HabilidadesViewController.swift
//  CV
//
//  Created by Alumno on 11/3/26.
//

import UIKit

class HabilidadesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Aparecera la vista (viewWillAppear)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("La vista desaparece (viewWillAppear)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("La vista desaparecera (viewWillDisappear)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("La vista desaparecio (viewWillDisappear)")
    }
}

