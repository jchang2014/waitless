@Reservations = React.createClass
  getInitialState: ->
    reservations: @props.data
  render: ->
    React.DOM.div
      className: 'restaurant-waitlist-info'
      React.DOM.table
        className: 'waitlist-table'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Party Size'
            React.DOM.th null, 'Signed at'
            React.DOM.th null, 'Wait Time'
        React.DOM.tbody null,
          for reservation in @state.reservations
            React.createElement Reservation, key:reservation.id, reservation: reservation

