resource "google_monitoring_dashboard" "postgres_dashboard_enable" {
  project = var.project
  count=var.postgres_dashboard_enable ? 1: 0
  dashboard_json = <<EOF
{
  "displayName": "${var.postgres_dashboard_name}",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Number of transactions",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"cloudsql.googleapis.com/database/postgresql/transaction_count\" resource.type=\"cloudsql_database\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "PostgreSQL Connections",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"cloudsql.googleapis.com/database/postgresql/num_backends\" resource.type=\"cloudsql_database\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Lag bytes",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"cloudsql.googleapis.com/database/postgresql/replication/replica_byte_lag\" resource.type=\"cloudsql_database\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "By"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}


EOF
}