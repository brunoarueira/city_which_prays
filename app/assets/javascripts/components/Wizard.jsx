class Wizard extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      step: 0,
      steps: this.props.steps,
      volunteer: this.props.volunteer
    };

    this.nextButton = this.nextButton.bind(this);
    this.submitRegistration = this.submitRegistration.bind(this);
    this.handleNextStepClick = this.handleNextStepClick.bind(this);
  }

  nextButton (data) {
    var handleClick = (e) => {
      e.preventDefault();

      this.handleNextStepClick(data);
    }.bind(this);

    return (
      <button className="btn btn-green btn-lg pull-right" onClick={handleClick}>Pr&oacute;ximo</button>
    );
  }

  submitRegistration (data) {
    var volunteer = data,
        handleClick = (e) => {
          e.preventDefault();

          $.ajax({
            method: "POST",
            url: APIEndpoints.VOLUNTEER,
            data: { volunteer: volunteer },
            dataType: "json"
          }).then(json => {
            this.nextStep();
          })
        }.bind(this);

    return (
      <div className="text-center">
        <button className="btn btn-green btn-lg" onClick={handleClick}>Salvar</button>
      </div>
    );
  }

  currentStep () {
    return this.state.steps[this.state.step];
  }

  nextStep () {
    var nextStep = this.state.step + 1,
        nextCurrentStep = this.state.steps[nextStep];

    if (nextCurrentStep) {
      nextCurrentStep.active = true;

      this.state.steps[nextStep] = nextCurrentStep;

      var steps = this.state.steps;

      this.setState({
        step: nextStep,
        steps: steps
      });
    } else {
      this.setState({
        step: nextStep
      });
    }
  }

  handleNextStepClick (data) {
    this.nextStep();

    this.setState({
      volunteer: data
    });

    this.props.saveValues(data);
  }

  wizardHeader () {
    var header = this.state.steps.map(function (step, i) {
      var className = "text-center step",
          title = step.title;

      if (!step.active) {
        className = "text-center step step-disabled";
      }

      if (Array.isArray(step.title)) {
        title = title.map(function (textOrHTML, index) {
          return <span key={index}>{textOrHTML}</span>
        });
      }

      return <li key={i} className={className}><WizardIconStep key={i} id={i} icon={step.icon} title={step.title} /></li>;
    });

    return header;
  }

  callToActionText () {
    var callToActionText = this.currentStep().callToActionText,
        text = callToActionText.map(function (textOrHTML, index) {
          return <span key={index}>{textOrHTML}</span>
        });

    return text;
  }

  stepToShow () {
    switch (this.state.step) {
      case 0:
        return <VolunteerRegister nextButton={this.nextButton}
                                  volunteer={this.state.volunteer} />;
      case 1:
        return <HomeToDistribute nextButton={this.nextButton}
                                 volunteer={this.state.volunteer} />;
      case 2:
        return <AttendingChurch submitRegistration={this.submitRegistration}
                                volunteer={this.state.volunteer} />
    }
  }

  mainFlow () {
    var mainFlowView;

    if (this.state.step !== 3) {
      mainFlowView = (
        <div>
          <div className="row bg-light-gray">
            <ul className="list-inline steps">
              {this.wizardHeader()}
            </ul>
          </div>

          <div className="row">
            <div className="call-to-action text-center center-block">
              {this.callToActionText()}
            </div>
          </div>

          {this.stepToShow()}

          <div className="row">
            &nbsp;
          </div>
        </div>
      );
    } else if (this.state.step === 3) {
      mainFlowView = <Success />
    }

    return mainFlowView;
  }

  render () {
    return this.mainFlow();
  }
}
