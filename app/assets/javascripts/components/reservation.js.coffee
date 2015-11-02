@Reservation = React.createClass
  newDate: (date) ->
    thedate = new Date(Date.parse(date));
    return thedate;
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.reservation.name
      React.DOM.td null, @props.reservation.number_in_party
      React.DOM.td null, new Date(Date.parse(@props.reservation.created_at)).toLocaleString()
      React.DOM.td null, '20'
    