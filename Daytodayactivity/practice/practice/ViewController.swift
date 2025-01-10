//
//  ViewController.swift
//  practice
//
//  Created by FCI on 20/11/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var selectedValueLabel: UILabel! // Label to display selected value

    let items = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grapes"] // Array of items

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the data source and delegate for the picker view
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Single column in picker view
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count // Number of rows equals the array count
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row] // Display the item at the current row
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Get the selected item and update the label
        let selectedItem = items[row]
        selectedValueLabel.text = "Selected: \(selectedItem)"
    }
}
