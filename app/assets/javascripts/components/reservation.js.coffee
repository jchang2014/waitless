@Reservation = React.createClass
	render: ->
		React.DOM.tr null,
			React.DOM.td null, @props.reservation.name
			React.DOM.td null, @props.reservation.number_in_party
			React.DOM.td null, @props.reservation.created_at
			React.DOM.td null, '20'
