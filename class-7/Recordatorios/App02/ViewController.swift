//
//  ViewController.swift
//  App02
//
//  Created by Alumno on 3/3/26.
//

import UIKit

final class RemindersViewController: UIViewController {

    private var reminders: [String] = ["Pagar internet", "Hacer la tarea"]

    private let listLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Recordatorios"

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
        let text = reminders.enumerated()
            .map { "\($0.offset + 1). \($0.element)" }
            .joined(separator: "\n")
        listLabel.text = text.isEmpty ? "Sin recordatorios." : text
    }

    @objc private func openAdd() {
        let addVC = AddReminderViewController()
        addVC.onSave = { [weak self] newText in
            self?.reminders.append(newText)
            self?.refreshUI()
        }

        addVC.modalPresentationStyle = .pageSheet
        present(addVC, animated: true)
    }
}

final class AddReminderViewController: UIViewController {

    var onSave: ((String) -> Void)?

    private let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        title = "Nuevo"

        let label = UILabel()
        label.text = "Escribe tu recordatorio:"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        textField.borderStyle = .roundedRect
        textField.placeholder = "Ej. Comprar agua"
        textField.translatesAutoresizingMaskIntoConstraints = false

        let save = UIButton(type: .system)
        save.setTitle("Guardar", for: .normal)
        save.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        save.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        save.translatesAutoresizingMaskIntoConstraints = false

        let cancel = UIButton(type: .system)
        cancel.setTitle("Cancelar", for: .normal)
        cancel.titleLabel?.font = .systemFont(ofSize: 18)
        cancel.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        cancel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(save)
        view.addSubview(cancel)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            save.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            save.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            cancel.topAnchor.constraint(equalTo: save.bottomAnchor, constant: 12),
            cancel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func saveTapped() {
        let text = (textField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        onSave?(text)          // 👈 regresamos el dato
        dismiss(animated: true)
    }

    @objc private func cancelTapped() {
        dismiss(animated: true)
    }
}
