package snippets

"tea cmds": {
	prefix:      "tCmds"
	description: "insert []tea.Cmd variable"
	body: """
		var cmds []tea.Cmd
		"""
}

"tea cmd": {
	prefix:      "tCmd"
	description: "insert tea.Cmd variable"
	body: """
		var cmd tea.Cmd
		"""
}

"tea model": {
	prefix:      "tModel"
	description: "create a tea.Model"
	body: """
		type ${1:Model} struct {}

		var _ tea.Model = ${1:Model}{}

		func (m ${1:Model}) Init() tea.Cmd { return nil }
		func (m ${1:Model}) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
			return m, nil
		}
		func (m ${1:Model}) View() string {
			return ""
		}
		"""
}

"tea message switch": {
	prefix:      "tMsg"
	description: "tea message switch"
	body: """
		switch msg := msg.(type) {
		case tea.KeyMsg:
			switch msg.Type {
			case tea.KeyCtrlC:
				return m, tea.Quit
			}
		case tea.WindowSizeMsg:
		
		}
		"""
}

"tea app": {
	prefix:      "tApp"
	description: "complete tea application"
	body: """
		package main
		
		import (
			tea "github.com/charmbracelet/bubbletea"
		)
		
		type model struct{}
		
		func (m model) Init() tea.Cmd { return nil }
		func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
			switch msg := msg.(type) {
			case tea.KeyMsg:
				switch msg.Type {
				case tea.KeyCtrlC:
					return m, tea.Quit
				}
			}
			var cmds []tea.Cmd
			return m, tea.Batch(cmds...)
		}
		func (m model) View() string {
			return "Hello World"
		}
		
		func main() {
			m := model{}
		
			app := tea.NewProgram(m, tea.WithAltScreen())
			if _, err := app.Run(); err != nil {
				panic(err)
			}
		}
		"""
}
