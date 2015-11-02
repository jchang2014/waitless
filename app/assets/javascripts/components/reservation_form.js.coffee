@ReservationForm = React.createClass
	getInitialState: ->
		name: ''
		number_in_party: ''
	render: ->
		React.DOM.form
			className: 'waitlist-form'
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Name'
					name: 'name'
					value: @state.name
					onChange: @handleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Party size'
					name: 'number_in_party'
					value: @state.number_in_party
					onChange: @handleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.button
					type: 'submit'
					className: 'btn form-control'
					'Sign me up!'	