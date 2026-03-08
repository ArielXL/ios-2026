//
//  ContactsViewController.swift
//  App03
//
//  Created by Alumno on 3/3/26.
//

import UIKit

protocol AddContactDelegate: AnyObject {
    func didCreateContact(name: String)
}

final class ContactsViewController: UIViewController, AddContactDelegate {

    private var contacts: [String] = ["Ana", "Luis", "María"]
    private let listLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Contactos"

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(openAdd)
        )

        listLabel.numberOfLines = 0
        listLabel.font = .systemFont(ofSize: 18)
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listLabel)

        NSLayoutConstraint.activate([
            listLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        refreshUI()
    }

    private func refreshUI() {
        let text = contacts.enumerated()
            .map { "\($0.offset + 1). \($0.element)" }
            .joined(separator: "\n")
        listLabel.text = text.isEmpty ? "Sin contactos." : text
    }

    @objc private func openAdd() {
        let addVC = AddContactViewController()
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }

    // MARK: - AddContactDelegate
    func didCreateContact(name: String) {
        contacts.append(name)
        refreshUI()
    }
}

final class AddContactViewController: UIViewController {

    weak var delegate: AddContactDelegate?

    private let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Nuevo contacto"

        textField.borderStyle = .roundedRect
        textField.placeholder = "Nombre"
        textField.translatesAutoresizingMaskIntoConstraints = false

        let save = UIButton(type: .system)
        save.setTitle("Guardar", for: .normal)
        save.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        save.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        save.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(textField)
        view.addSubview(save)

        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            save.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            save.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func saveTapped() {
        let name = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !name.isEmpty else { return }
        delegate?.didCreateContact(name: name)   // 👈 manda dato hacia atrás
        navigationController?.popViewController(animated: true)
    }
}
