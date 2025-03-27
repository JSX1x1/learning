import sys
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QLabel, QLineEdit, QCheckBox, QRadioButton, QGroupBox, QComboBox, QSpinBox

class MyWindow(QWidget):
    def __init__(self):
        super().__init__()

        # Window setup
        self.setWindowTitle('PyQt6 Example')
        self.setGeometry(100, 100, 400, 300)

        # Main layout (vertical)
        self.layout = QVBoxLayout()

        # Label
        self.label = QLabel('Welcome to PyQt6!', self)
        self.layout.addWidget(self.label)

        # ------------------------------
        # 1. Button Interaction
        # ------------------------------
        self.button = QPushButton('Change Text', self)
        self.button.clicked.connect(self.on_button_click)
        self.layout.addWidget(self.button)

        # ------------------------------
        # 2. Text Input (QLineEdit)
        # ------------------------------
        self.text_input = QLineEdit(self)
        self.text_input.setPlaceholderText('Enter some text')
        self.layout.addWidget(self.text_input)

        # Button to update the label with text from the input field
        self.text_button = QPushButton('Set Label Text', self)
        self.text_button.clicked.connect(self.on_text_button_click)
        self.layout.addWidget(self.text_button)

        # ------------------------------
        # 3. Checkbox Interaction
        # ------------------------------
        self.checkbox = QCheckBox('I agree to the terms and conditions', self)
        self.checkbox.stateChanged.connect(self.on_checkbox_change)
        self.layout.addWidget(self.checkbox)

        # ------------------------------
        # 4. Radio Button Interaction
        # ------------------------------
        self.radio_group = QGroupBox('Choose an option:')
        radio_layout = QVBoxLayout()

        self.radio1 = QRadioButton('Option 1', self)
        self.radio2 = QRadioButton('Option 2', self)
        self.radio1.toggled.connect(self.on_radio_change)
        self.radio2.toggled.connect(self.on_radio_change)

        radio_layout.addWidget(self.radio1)
        radio_layout.addWidget(self.radio2)
        self.radio_group.setLayout(radio_layout)

        self.layout.addWidget(self.radio_group)

        # ------------------------------
        # 5. Dropdown (ComboBox) Interaction
        # ------------------------------
        self.combo_box = QComboBox(self)
        self.combo_box.addItem('Select a color')
        self.combo_box.addItem('Red')
        self.combo_box.addItem('Green')
        self.combo_box.addItem('Blue')
        self.combo_box.currentIndexChanged.connect(self.on_combo_change)
        self.layout.addWidget(self.combo_box)

        # ------------------------------
        # 6. Spin Box Interaction (Numeric Input)
        # ------------------------------
        self.spin_box = QSpinBox(self)
        self.spin_box.setRange(0, 100)
        self.spin_box.valueChanged.connect(self.on_spin_box_change)
        self.layout.addWidget(self.spin_box)

        # Setting the layout for the window
        self.setLayout(self.layout)

    # ------------------------------
    # Interaction Functions
    # ------------------------------
    
    def on_button_click(self):
        """Changes the label text when the button is clicked."""
        self.label.setText('Button clicked!')

    def on_text_button_click(self):
        """Sets the label text to what the user typed in the QLineEdit."""
        text = self.text_input.text()
        self.label.setText(f'You entered: {text}')

    def on_checkbox_change(self):
        """Updates the label based on the checkbox state."""
        if self.checkbox.isChecked():
            self.label.setText('You agreed to the terms!')
        else:
            self.label.setText('You did not agree to the terms.')

    def on_radio_change(self):
        """Updates the label based on the selected radio button."""
        if self.radio1.isChecked():
            self.label.setText('Option 1 selected')
        elif self.radio2.isChecked():
            self.label.setText('Option 2 selected')

    def on_combo_change(self):
        """Updates the label based on the selected item in the combo box."""
        selected_color = self.combo_box.currentText()
        self.label.setText(f'Selected color: {selected_color}')

    def on_spin_box_change(self):
        """Updates the label based on the value in the spin box."""
        spin_value = self.spin_box.value()
        self.label.setText(f'Spin box value: {spin_value}')


# ------------------------------
# Running the Application
# ------------------------------

def main():
    app = QApplication(sys.argv)
    window = MyWindow()
    window.show()
    sys.exit(app.exec())

if __name__ == "__main__":
    main()
