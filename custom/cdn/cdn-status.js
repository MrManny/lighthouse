'use strict';

const {Audit} = require('lighthouse');

class CdnStatus extends Audit {
  static KnownCdnHeaderExpr = /^(x|cf)(-varnish)?-cache(-status)?$/i;

  static get meta() {
    return {
      id: 'cdn/cdn-status',
      title: 'CDN Status',
      description: 'CDN hit or miss',
      scoreDisplayMode: 'informative',
      requiredArtifacts: [
        'devtoolsLogs'
      ]
    }
  }

  static async audit(artifacts) {
    const firstInteraction = this.findFirstContentfulInteraction(artifacts.devtoolsLogs.defaultPass);
    if (typeof firstInteraction === 'undefined') {
      return;
    }

    const keys = Object.keys(firstInteraction.headers);
    const matching = keys
      .filter(key => this.KnownCdnHeaderExpr.test(key))
      .map(key => {
        const result = {};
        result[key] = firstInteraction.headers[key];
        return result;
      })
    ;

    return {
      score: matching.length,
      displayValue: JSON.stringify(matching),
      rawValue: JSON.stringify(matching),
      details: {
        type: 'debugdata',
        items: matching
      }
    };
  }

  static findFirstContentfulInteraction(devtoolsLogsPass) {
    const candidates = devtoolsLogsPass
      .filter(response => response.method === 'Network.responseReceived')
      .map(response => response.params.response)
      .filter(response => response.status >= 200 && response.status < 300)
    ;

    return candidates[0];
  }
}

module.exports = CdnStatus;
