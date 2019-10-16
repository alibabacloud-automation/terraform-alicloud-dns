package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExampleNew(t *testing.T) {
	t.Parallel()
	uniqueNum := random.Random(10000, 99999)
	domainName := fmt.Sprintf("tf-terratestdns%d.abc", uniqueNum)
	groupName := fmt.Sprintf("tf-terratestdns%d", uniqueNum)
	recordList := []map[string]string{
		{
			"name":        domainName,
			"host_record": "alimail",
			"type":        "CNAME",
			"value":       "mail.mxhichina.com",
			"priority":    "0",
			"ttl":         "600",
		},
		{
			"name":        domainName,
			"host_record": "alimail",
			"type":        "CNAME",
			"value":       "mail.mxhichina1.com",
			"priority":    "0",
			"ttl":         "600",
		},
	}

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "./basic/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"domain_name": domainName,
			"group_name":  groupName,
			"record_list": recordList,
			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	actualThisDomainName := terraform.Output(t, terraformOptions, "this_domain_name")
	actualThisGroupName := terraform.Output(t, terraformOptions, "this_group_name")
	actualThisRecords := terraform.OutputList(t, terraformOptions, "this_records")
	recordsMapSli := StringSli2MapSli(actualThisRecords)
	for _, m := range recordsMapSli {
		// delete these keys here cause the server always add them, but we couldn't check.
		delete(m, "locked")
		delete(m, "status")
		delete(m, "id")
		delete(m, "routing")
	}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, domainName, actualThisDomainName)
	assert.Equal(t, groupName, actualThisGroupName)
	assert.Equal(t, recordList, recordsMapSli)
}

func StringSli2MapSli(strSli []string) (mSli []map[string]string) {
	for _, s := range strSli {
		fmt.Println(s)
		mmSli := make(map[string]string)
		// this string format like `map[key1:value1 key2:value2]`
		s = s[4 : len(s)-1]
		sSli := strings.Fields(s)

		for _, ss := range sSli {
			n := strings.Index(ss, ":")
			if len(ss) != n+1 {
				mmSli[ss[:n]] = ss[n+1:]
			}
		}
		mSli = append(mSli, mmSli)
	}
	return
}
