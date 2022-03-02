//
//  SelectField.swift
//  ozan-case-study
//
//  Created by Developer on 2.03.2022.
//

import UIKit

class SelectTextField: UITextField {
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}

final class SelectFieldView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textField: SelectTextField!
    
    var pickerDataSource: PickerDataSource?
    var didSelectRowHandler: ((Int) -> Void)?
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        initXib()
        textField.delegate = self
        textField.inputView = pickerView
        textField.addDoneButtonToKeyboard()
    }
    
    private func initXib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: Bundle(for: type(of: self)))
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        contentView.fillSuperView()
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        if textField.isFirstResponder == false {
            textField.becomeFirstResponder()
        }
    }
    
    func select(_ row: Int) {
        textField.text = pickerDataSource?.titleFor(row: row)
    }
}

// MARK: UITextFieldDelegate
extension SelectFieldView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// MARK: UIPickerViewDataSource
extension SelectFieldView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource?.numberOfRows ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource?.titleFor(row: row)
    }
}

// MARK: UIPickerViewDelegate
extension SelectFieldView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = pickerDataSource?.titleFor(row: row)
        didSelectRowHandler?(row)
    }
}
