const React = require('react');
const createReactClass = require('create-react-class');
const injectTapEventPlugin = require('react-tap-event-plugin');
const RaisedButton = require('material-ui/RaisedButton').default;
const MuiThemeProvider = require('material-ui/styles/MuiThemeProvider').default;
const Dialog = require('material-ui/Dialog').default;

injectTapEventPlugin();

const MyMuiThemeProvider = createReactClass({
  render: function () {
    const props = this.props;
    // console.log("My MyMuiThemeProvider Props", props)
    return React.createElement(MuiThemeProvider, {},
      React.createElement("div", { className: 'hossa' }, props.children)
    );
  }
});

exports.raisedButtonClass = RaisedButton;
exports.muiThemeProviderClass = MyMuiThemeProvider;
exports.dialogClass = Dialog;

