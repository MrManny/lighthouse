'use strict';

const {Audit} = require('lighthouse');

class CdnStatus extends Audit {
  static KnownCdnHeaderExpr = /^(x|cf)(-varnish)?-cache(-status)?$/i;
  static EdgeLocationHeaderExpr = /^(x-served-by|x-amz-cf-pop|cf-ray|x-msedge-ref)$/i;
  static EdgeLocationValueExpr = /-([a-z]{2,3}[0-9]{0,3})$/i;

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
    const matchingCdnHitMiss = keys
      .filter(key => this.KnownCdnHeaderExpr.test(key))
      .map(key => firstInteraction.headers[key])
    ;
    const matchingCdnLocation = keys
      .filter(key => this.EdgeLocationHeaderExpr.test(key))
      .map(key => {
        const value = firstInteraction.headers[key];
        const matches = this.EdgeLocationValueExpr.exec(value);
        return matches && matches.length > 1 ? matches[1] : value;
      })
    ;

    return {
      score: matchingCdnHitMiss.length,
      displayValue: JSON.stringify(matchingCdnHitMiss),
      rawValue: matchingCdnHitMiss.length,
      details: {
        type: 'debugdata',
        items: {
          cache: matchingCdnHitMiss,
          edge: matchingCdnLocation
        }
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
