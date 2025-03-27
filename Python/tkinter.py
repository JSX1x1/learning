import tkinter as tk
from tkinter import messagebox

class MyWindow(tk.Tk):
    def __init__(self):
        super().__init__()

        # Window setup
        self.title('Tkinter Example')
        self.geometry('400x400')

        # Create and pack widgets
        self.create_widgets()

    def create_widgets(self):
        # ------------------------------
        # 1. Label Widget
        # ------------------------------
        self.label = tk.Label(self, text='Welcome to Tkinter!', font=("Arial", 14))
        self.label.pack(pady=10)

        # ------------------------------
        # 2. Button Widget (Button Interaction)
        # ------------------------------
        self.button = tk.Button(self, text='Change Text', command=self.on_button_click)
        self.button.pack(pady=10)

        # ------------------------------
        # 3. Text Input Widget (Entry)
        # ------------------------------
        self.text_input = tk.Entry(self)
        self.text_input.insert(0, 'Enter some text')
        self.text_input.pack(pady=10)

        # Button to update label with text input value
        self.text_button = tk.Button(self, text='Set Label Text', command=self.on_text_button_click)
        self.text_button.pack(pady=10)

        # ------------------------------
        # 4. Checkbox Widget (Checkbox Interaction)
        # ------------------------------
        self.checkbox_var = tk.BooleanVar()
        self.checkbox = tk.Checkbutton(self, text='I agree to the terms and conditions', variable=self.checkbox_var, command=self.on_checkbox_change)
        self.checkbox.pack(pady=10)

        # ------------------------------
        # 5. Radio Button Widget (Radio Button Interaction)
        # ------------------------------
        self.radio_var = tk.StringVar()
        self.radio1 = tk.Radiobutton(self, text="Option 1", value="Option 1", variable=self.radio_var, command=self.on_radio_change)
        self.radio2 = tk.Radiobutton(self, text="Option 2", value="Option 2", variable=self.radio_var, command=self.on_radio_change)
        self.radio1.pack(pady=5)
        self.radio2.pack(pady=5)

        # ------------------------------
        # 6. Drop-down (ComboBox) Widget
        # ------------------------------
        self.combo_box = tk.OptionMenu(self, self.radio_var, 'Select a color', 'Red', 'Green', 'Blue')
        self.combo_box.pack(pady=10)

        # ------------------------------
        # 7. Spin Box Widget (Spin Box Interaction)
        # ------------------------------
        self.spin_box = tk.Spinbox(self, from_=0, to=100, command=self.on_spin_box_change)
        self.spin_box.pack(pady=10)

    # ------------------------------
    # Interaction Functions
    # ------------------------------

    def on_button_click(self):
        """Changes the label text when the button is clicked."""
        self.label.config(text="Button clicked!")

    def on_text_button_click(self):
        """Sets the label text to what the user typed in the Entry."""
        text = self.text_input.get()
        self.label.config(text=f'You entered: {text}')

    def on_checkbox_change(self):
        """Updates the label based on the checkbox state."""
        if self.checkbox_var.get():
            self.label.config(text='You agreed to the terms!')
        else:
            self.label.config(text='You did not agree to the terms.')

    def on_radio_change(self):
        """Updates the label based on the selected radio button."""
        self.label.config(text=f'Selected: {self.radio_var.get()}')

    def on_spin_box_change(self):
        """Updates the label based on the value in the Spinbox."""
        spin_value = self.spin_box.get()
        self.label.config(text=f'Spin box value: {spin_value}')

# ------------------------------
# Running the Application
# ------------------------------

def main():
    window = MyWindow()
    window.mainloop()

if __name__ == "__main__":
    main()
