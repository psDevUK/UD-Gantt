import React from 'react';
import ReactDOM from "react-dom";
import Chart from "react-google-charts";

const columns = [
  { type: "string", label: "TaskID" },
  { type: "string", label: "TaskName" },
  { type: "string", label: "Resource" },
  { type: "date", label: "Start" },
  { type: "date", label: "End" },
  { type: "number", label: "Duration" },
  { type: "number", label: "PercentComplete" },
  { type: "string", label: "Dependencies" }
];

class UDGantt extends React.Component {
  state = {
    chartImageURI: ""
  }
  render() {
    return (
      <div className="GanttApp">
        <Chart
          chartType="Gantt"
          data={[columns, ...this.props.rows]}
          width={this.props.width}
          height={this.props.height}
          legendToggle
          options={{
            gantt: {
              criticalPathEnabled: this.props.criticalPathEnabled,
              criticalPathStyle: {
                stroke: this.props.criticalStroke,
                strokeWidth: this.props.criticalStrokeWidth,
              },
              innerGridHorizLine: {
                stroke: this.props.gridStroke,
                strokeWidth: this.props.gridStrokeWidth,
              },
              innerGridTrack: { fill: this.props.innerGrid },
              innerGridDarkTrack: { fill: this.props.innerGridDark },
            },
          }}
        />
        <div>
          <img src={this.state.chartImageURI} />
        </div>
      </div>
    )
  }
}

export default UDGantt
