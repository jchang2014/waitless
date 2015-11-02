@ReservationForm = React.createClass
	getInitialState: ->
		name: ''
		number_in_party: ''
	handleChange: (e) ->
		name = e.target.name
		@setState "#{name}": e.target.value
	valid: ->
		@state.name && @state.number_in_party
	handleSubmit: (e) ->
		e.preventDefault()
		$.post "/restaurants/#{@props.id}/reservations", {reservation: @state}, (data) =>
			@props.handleNewReservation data
			@setState @getInitialState()
		, 'JSON'
	render: ->
		React.DOM.form
			className: 'waitlist-form'
			onSubmit: @handleSubmit
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
					type: 'number'
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
					disabled: !@valid()
					'Sign me up!'	